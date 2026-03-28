import '../models/chat_model.dart';
import '../models/message_model.dart';
import '../providers/mock_data_provider.dart';

/// Repository for chat operations
class ChatRepository {
  // In-memory storage for demo (replace with real database/API)
  final List<ChatModel> _chats = MockDataProvider.getMockChats();
  final Map<String, List<MessageModel>> _messages = {};

  /// Get all chats for current user
  Future<List<ChatModel>> getChats({bool includeArchived = false}) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    if (includeArchived) {
      return _chats;
    }

    return _chats.where((chat) => !chat.isArchived).toList()
      ..sort((a, b) {
        // Pinned chats first
        if (a.isPinned && !b.isPinned) return -1;
        if (!a.isPinned && b.isPinned) return 1;
        // Then by timestamp
        return b.timestamp.compareTo(a.timestamp);
      });
  }

  /// Get archived chats
  Future<List<ChatModel>> getArchivedChats() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _chats.where((chat) => chat.isArchived).toList();
  }

  /// Get messages for a specific chat
  Future<List<MessageModel>> getMessages(String chatId) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return cached messages or generate new ones
    if (!_messages.containsKey(chatId)) {
      _messages[chatId] = MockDataProvider.getMockMessages(chatId);
    }

    return _messages[chatId]!;
  }

  /// Send a message
  Future<MessageModel> sendMessage({
    required String chatId,
    required String content,
    MessageType type = MessageType.text,
    String? replyToId,
  }) async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));

    final message = MessageModel(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      chatId: chatId,
      senderId: MockDataProvider.currentUserId,
      content: content,
      type: type,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
      replyToId: replyToId,
    );

    // Add to messages
    if (!_messages.containsKey(chatId)) {
      _messages[chatId] = [];
    }
    _messages[chatId]!.add(message);

    // Update chat's last message
    final chatIndex = _chats.indexWhere((c) => c.id == chatId);
    if (chatIndex != -1) {
      _chats[chatIndex] = _chats[chatIndex].copyWith(
        lastMessage: message,
        timestamp: message.timestamp,
      );
    }

    return message;
  }

  /// Delete a message
  Future<bool> deleteMessage(String messageId, String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (_messages.containsKey(chatId)) {
      _messages[chatId]!.removeWhere((m) => m.id == messageId);
      return true;
    }

    return false;
  }

  /// Add reaction to message
  Future<bool> addReaction({
    required String messageId,
    required String chatId,
    required String emoji,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));

    if (_messages.containsKey(chatId)) {
      final messageIndex =
          _messages[chatId]!.indexWhere((m) => m.id == messageId);
      if (messageIndex != -1) {
        final message = _messages[chatId]![messageIndex];
        final reactions = List<MessageReaction>.from(message.reactions);

        // Remove existing reaction from this user
        reactions
            .removeWhere((r) => r.userId == MockDataProvider.currentUserId);

        // Add new reaction
        reactions.add(MessageReaction(
          userId: MockDataProvider.currentUserId,
          emoji: emoji,
          timestamp: DateTime.now(),
        ));

        _messages[chatId]![messageIndex] =
            message.copyWith(reactions: reactions);
        return true;
      }
    }

    return false;
  }

  /// Archive a chat
  Future<bool> archiveChat(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(isArchived: true);
      return true;
    }

    return false;
  }

  /// Unarchive a chat
  Future<bool> unarchiveChat(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(isArchived: false);
      return true;
    }

    return false;
  }

  /// Mute a chat
  Future<bool> muteChat(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(isMuted: true);
      return true;
    }

    return false;
  }

  /// Delete a chat
  Future<bool> deleteChat(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    _chats.removeWhere((c) => c.id == chatId);
    _messages.remove(chatId);
    return true;
  }

  /// Mark messages as read
  Future<void> markAsRead(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final index = _chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(unreadCount: 0);
    }
  }

  /// Search chats
  Future<List<ChatModel>> searchChats(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (query.isEmpty) return getChats();

    return _chats.where((chat) {
      final name = chat.name?.toLowerCase() ?? '';
      final lastMessage = chat.lastMessage?.content.toLowerCase() ?? '';
      final q = query.toLowerCase();

      return name.contains(q) || lastMessage.contains(q);
    }).toList();
  }
}
