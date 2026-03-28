import '../models/user_model.dart';
import '../models/message_model.dart';
import '../models/chat_model.dart';
import '../models/status_model.dart';
import '../models/call_model.dart';
import '../models/notification_model.dart';

/// Mock data provider for testing
/// Replace with real API calls when integrating with backend
class MockDataProvider {
  // Current user ID (simulated logged-in user)
  static const String currentUserId = 'user_1';

  // Mock Users
  static List<UserModel> getMockUsers() {
    return [
      UserModel(
        id: 'user_1',
        username: 'john_doe',
        email: 'john@example.com',
        name: 'John Doe',
        avatar: 'https://i.pravatar.cc/150?img=1',
        status: 'Available',
        bio: 'Hey there! I am using CliChat',
        isOnline: true,
        createdAt: DateTime.now().subtract(const Duration(days: 365)),
      ),
      UserModel(
        id: 'user_2',
        username: 'jane_smith',
        email: 'jane@example.com',
        name: 'Jane Smith',
        avatar: 'https://i.pravatar.cc/150?img=2',
        status: 'Busy',
        bio: 'Working from home',
        isOnline: true,
        lastSeen: DateTime.now().subtract(const Duration(minutes: 5)),
        createdAt: DateTime.now().subtract(const Duration(days: 300)),
      ),
      UserModel(
        id: 'user_3',
        username: 'mike_wilson',
        email: 'mike@example.com',
        name: 'Mike Wilson',
        avatar: 'https://i.pravatar.cc/150?img=3',
        status: 'Available',
        bio: 'Flutter Developer',
        isOnline: false,
        lastSeen: DateTime.now().subtract(const Duration(hours: 2)),
        createdAt: DateTime.now().subtract(const Duration(days: 200)),
      ),
      UserModel(
        id: 'user_4',
        username: 'sarah_jones',
        email: 'sarah@example.com',
        name: 'Sarah Jones',
        avatar: 'https://i.pravatar.cc/150?img=4',
        status: 'Available',
        bio: 'Designer & Artist',
        isOnline: true,
        createdAt: DateTime.now().subtract(const Duration(days: 150)),
      ),
      UserModel(
        id: 'user_5',
        username: 'alex_brown',
        email: 'alex@example.com',
        name: 'Alex Brown',
        avatar: 'https://i.pravatar.cc/150?img=5',
        status: 'Offline',
        bio: 'Tech enthusiast',
        isOnline: false,
        lastSeen: DateTime.now().subtract(const Duration(days: 1)),
        createdAt: DateTime.now().subtract(const Duration(days: 100)),
      ),
      UserModel(
        id: 'user_6',
        username: 'sangita_fai',
        email: 'sangita@example.com',
        name: 'sangita Fai',
        avatar: 'https://i.pravatar.cc/150?img=6',
        status: 'Available',
        bio: 'Hey there! I am using CliChat',
        isOnline: true,
        createdAt: DateTime.now().subtract(const Duration(days: 80)),
      ),
      UserModel(
        id: 'user_7',
        username: 'rutiiii',
        email: 'rutiiii@example.com',
        name: 'Rutiiii 😄',
        avatar: 'https://i.pravatar.cc/150?img=7',
        status: 'Available',
        bio: 'Hey there! I am using CliChat',
        isOnline: true,
        createdAt: DateTime.now().subtract(const Duration(days: 50)),
      ),
    ];
  }

  // Mock Messages
  static List<MessageModel> getMockMessages(String chatId) {
    final now = DateTime.now();
    return [
      MessageModel(
        id: 'msg_1',
        chatId: chatId,
        senderId: 'user_2',
        content: 'Hey! How are you?',
        timestamp: now.subtract(const Duration(hours: 2)),
        status: MessageStatus.read,
      ),
      MessageModel(
        id: 'msg_2',
        chatId: chatId,
        senderId: currentUserId,
        content: 'I\'m good! How about you?',
        timestamp: now.subtract(const Duration(hours: 1, minutes: 55)),
        status: MessageStatus.read,
      ),
      MessageModel(
        id: 'msg_3',
        chatId: chatId,
        senderId: 'user_2',
        content: 'Doing great! Want to grab coffee later?',
        timestamp: now.subtract(const Duration(hours: 1, minutes: 50)),
        status: MessageStatus.read,
      ),
      MessageModel(
        id: 'msg_4',
        chatId: chatId,
        senderId: currentUserId,
        content: 'Sure! What time works for you?',
        timestamp: now.subtract(const Duration(hours: 1, minutes: 45)),
        status: MessageStatus.delivered,
        reactions: [
          MessageReaction(
            userId: 'user_2',
            emoji: '👍',
            timestamp: now.subtract(const Duration(hours: 1, minutes: 44)),
          ),
        ],
      ),
      MessageModel(
        id: 'msg_5',
        chatId: chatId,
        senderId: 'user_2',
        content: 'How about 3 PM?',
        timestamp: now.subtract(const Duration(minutes: 30)),
        status: MessageStatus.delivered,
      ),
    ];
  }

  // Mock Chats
  static List<ChatModel> getMockChats() {
    final now = DateTime.now();

    return [
      ChatModel(
        id: 'chat_1',
        type: ChatType.private,
        participantIds: [currentUserId, 'user_2'],
        lastMessage: MessageModel(
          id: 'msg_last_1',
          chatId: 'chat_1',
          senderId: 'user_2',
          content: 'How about 3 PM?',
          timestamp: now.subtract(const Duration(minutes: 30)),
          status: MessageStatus.delivered,
        ),
        unreadCount: 2,
        timestamp: now.subtract(const Duration(minutes: 30)),
        createdAt: now.subtract(const Duration(days: 10)),
      ),
      ChatModel(
        id: 'chat_2',
        type: ChatType.private,
        participantIds: [currentUserId, 'user_3'],
        lastMessage: MessageModel(
          id: 'msg_last_2',
          chatId: 'chat_2',
          senderId: currentUserId,
          content: 'Thanks for your help!',
          timestamp: now.subtract(const Duration(hours: 5)),
          status: MessageStatus.read,
        ),
        unreadCount: 0,
        timestamp: now.subtract(const Duration(hours: 5)),
        createdAt: now.subtract(const Duration(days: 20)),
      ),
      ChatModel(
        id: 'chat_3',
        type: ChatType.group,
        name: 'Flutter Developers',
        avatar: 'https://i.pravatar.cc/150?img=10',
        participantIds: [currentUserId, 'user_2', 'user_3', 'user_4'],
        lastMessage: MessageModel(
          id: 'msg_last_3',
          chatId: 'chat_3',
          senderId: 'user_4',
          content: 'Check out this new package!',
          timestamp: now.subtract(const Duration(hours: 1)),
          status: MessageStatus.delivered,
        ),
        unreadCount: 5,
        isPinned: true,
        timestamp: now.subtract(const Duration(hours: 1)),
        createdAt: now.subtract(const Duration(days: 30)),
      ),
      ChatModel(
        id: 'chat_4',
        type: ChatType.private,
        participantIds: [currentUserId, 'user_4'],
        lastMessage: MessageModel(
          id: 'msg_last_4',
          chatId: 'chat_4',
          senderId: 'user_4',
          content: 'Love the new design! 🎨',
          timestamp: now.subtract(const Duration(days: 1)),
          status: MessageStatus.read,
        ),
        unreadCount: 0,
        timestamp: now.subtract(const Duration(days: 1)),
        createdAt: now.subtract(const Duration(days: 15)),
      ),
      ChatModel(
        id: 'group_1',
        type: ChatType.group,
        name: 'IT Internship Opportunities Hub 🌐',
        avatar: 'https://via.placeholder.com/150', // Placeholder for group icon
        participantIds: [
          currentUserId,
          'user_2',
          'user_3',
          'user_4',
          'user_5',
          'user_6',
          'user_7'
        ],
        lastMessage: MessageModel(
          id: 'msg_last_group_1',
          chatId: 'group_1',
          senderId: 'user_7', // Rutiiii
          content: 'Happy Birthday mital Bhabhi 🎂🎂',
          timestamp: now.subtract(const Duration(minutes: 10)),
          status: MessageStatus.read,
        ),
        unreadCount: 97,
        isPinned: false,
        timestamp: now.subtract(const Duration(minutes: 10)),
        createdAt: now.subtract(const Duration(days: 60)),
      ),
    ];
  }

  // Mock Statuses
  static List<StatusModel> getMockStatuses() {
    final now = DateTime.now();
    return [
      StatusModel(
        id: 'status_1',
        userId: 'user_2',
        type: StatusType.text,
        content: 'Feeling great today! 😊',
        backgroundColor: '#6C5CE7',
        timestamp: now.subtract(const Duration(hours: 3)),
        viewedBy: [currentUserId],
      ),
      StatusModel(
        id: 'status_2',
        userId: 'user_3',
        type: StatusType.image,
        content: 'https://picsum.photos/400/600',
        timestamp: now.subtract(const Duration(hours: 5)),
        viewedBy: [],
      ),
      StatusModel(
        id: 'status_3',
        userId: 'user_4',
        type: StatusType.text,
        content: 'New project launching soon! 🚀',
        backgroundColor: '#00D9FF',
        timestamp: now.subtract(const Duration(hours: 8)),
        viewedBy: [currentUserId],
      ),
    ];
  }

  // Mock Calls
  static List<CallModel> getMockCalls() {
    final now = DateTime.now();
    return [
      CallModel(
        id: 'call_1',
        userId: 'user_2',
        type: CallType.video,
        direction: CallDirection.incoming,
        status: CallStatus.completed,
        duration: 1245, // 20 minutes 45 seconds
        timestamp: now.subtract(const Duration(hours: 2)),
      ),
      CallModel(
        id: 'call_2',
        userId: 'user_3',
        type: CallType.audio,
        direction: CallDirection.outgoing,
        status: CallStatus.completed,
        duration: 320, // 5 minutes 20 seconds
        timestamp: now.subtract(const Duration(hours: 6)),
      ),
      CallModel(
        id: 'call_3',
        userId: 'user_4',
        type: CallType.video,
        direction: CallDirection.incoming,
        status: CallStatus.missed,
        timestamp: now.subtract(const Duration(days: 1)),
      ),
      CallModel(
        id: 'call_4',
        userId: 'user_2',
        type: CallType.audio,
        direction: CallDirection.outgoing,
        status: CallStatus.rejected,
        timestamp: now.subtract(const Duration(days: 2)),
      ),
    ];
  }

  // Mock Notifications
  static List<NotificationModel> getMockNotifications() {
    final now = DateTime.now();
    return [
      NotificationModel(
        id: 'notif_1',
        type: NotificationType.message,
        title: 'New message from Jane Smith',
        description: 'How about 3 PM?',
        timestamp: now.subtract(const Duration(minutes: 30)),
        isRead: false,
        data: {'chatId': 'chat_1', 'userId': 'user_2'},
      ),
      NotificationModel(
        id: 'notif_2',
        type: NotificationType.mention,
        title: 'You were mentioned',
        description: '@john_doe check this out!',
        timestamp: now.subtract(const Duration(hours: 1)),
        isRead: false,
        data: {'chatId': 'chat_3'},
      ),
      NotificationModel(
        id: 'notif_3',
        type: NotificationType.missedCall,
        title: 'Missed call from Sarah Jones',
        description: 'Video call',
        timestamp: now.subtract(const Duration(days: 1)),
        isRead: true,
        data: {'userId': 'user_4', 'callId': 'call_3'},
      ),
      NotificationModel(
        id: 'notif_4',
        type: NotificationType.reaction,
        title: 'Jane reacted to your message',
        description: '👍',
        timestamp: now.subtract(const Duration(hours: 2)),
        isRead: true,
        data: {'chatId': 'chat_1', 'messageId': 'msg_4'},
      ),
    ];
  }

  // Get user by ID
  static UserModel? getUserById(String id) {
    try {
      return getMockUsers().firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get current user
  static UserModel getCurrentUser() {
    return getUserById(currentUserId)!;
  }
}
