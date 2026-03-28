import 'message_model.dart';

/// Chat model representing a conversation
class ChatModel {
  final String id;
  final ChatType type;
  final String? name; // For group chats
  final String? avatar; // For group chats
  final List<String> participantIds;
  final MessageModel? lastMessage;
  final int unreadCount;
  final bool isArchived;
  final bool isMuted;
  final bool isPinned;
  final DateTime timestamp;
  final DateTime? createdAt;

  ChatModel({
    required this.id,
    this.type = ChatType.private,
    this.name,
    this.avatar,
    required this.participantIds,
    this.lastMessage,
    this.unreadCount = 0,
    this.isArchived = false,
    this.isMuted = false,
    this.isPinned = false,
    required this.timestamp,
    this.createdAt,
  });

  // From JSON
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as String,
      type: ChatType.values.firstWhere(
        (e) => e.toString() == 'ChatType.${json['type']}',
        orElse: () => ChatType.private,
      ),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastMessage: json['lastMessage'] != null
          ? MessageModel.fromJson(json['lastMessage'] as Map<String, dynamic>)
          : null,
      unreadCount: json['unreadCount'] as int? ?? 0,
      isArchived: json['isArchived'] as bool? ?? false,
      isMuted: json['isMuted'] as bool? ?? false,
      isPinned: json['isPinned'] as bool? ?? false,
      timestamp: DateTime.parse(json['timestamp'] as String),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'name': name,
      'avatar': avatar,
      'participantIds': participantIds,
      'lastMessage': lastMessage?.toJson(),
      'unreadCount': unreadCount,
      'isArchived': isArchived,
      'isMuted': isMuted,
      'isPinned': isPinned,
      'timestamp': timestamp.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  // Copy with
  ChatModel copyWith({
    String? id,
    ChatType? type,
    String? name,
    String? avatar,
    List<String>? participantIds,
    MessageModel? lastMessage,
    int? unreadCount,
    bool? isArchived,
    bool? isMuted,
    bool? isPinned,
    DateTime? timestamp,
    DateTime? createdAt,
  }) {
    return ChatModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      participantIds: participantIds ?? this.participantIds,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
      isArchived: isArchived ?? this.isArchived,
      isMuted: isMuted ?? this.isMuted,
      isPinned: isPinned ?? this.isPinned,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

/// Chat types
enum ChatType {
  private,
  group,
}
