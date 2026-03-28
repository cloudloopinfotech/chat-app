import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/message_model.dart';
import '../../../data/models/chat_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/providers/mock_data_provider.dart';
import '../../../app/routes/app_routes.dart';

class GroupChatController extends GetxController {
  final messageController = TextEditingController();
  final messages = <MessageModel>[].obs;
  final isLoading = false.obs;
  final messageText = ''.obs;
  final chat = Rxn<ChatModel>();

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    chat.value = args?['chat'] as ChatModel?;
    messageController.addListener(() {
      messageText.value = messageController.text;
    });
    _loadMessages();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void _loadMessages() {
    isLoading.value = true;
    // Simulate network delay
    Future.delayed(const Duration(seconds: 1), () {
      messages.value = [
        MessageModel(
          id: '1',
          chatId: 'group_1',
          senderId: 'user_2',
          content: 'Happy birthday Sarah!🥳',
          timestamp: DateTime.now().subtract(const Duration(minutes: 40)),
          status: MessageStatus.read,
        ),
        MessageModel(
          id: '2',
          chatId: 'group_1',
          senderId: 'user_3',
          content: 'Happy Birthday Sarah!🎂💐',
          timestamp: DateTime.now().subtract(const Duration(minutes: 39)),
          status: MessageStatus.read,
        ),
        MessageModel(
          id: '3',
          chatId: 'group_1',
          senderId: 'user_4',
          content: 'Happy Birthday Sarah!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 36)),
          status: MessageStatus.read,
        ),
        MessageModel(
          id: '4',
          chatId: 'group_1',
          senderId: 'user_5',
          content: 'Happy Birthday Sarah! 💐🥧',
          timestamp: DateTime.now().subtract(const Duration(minutes: 18)),
          status: MessageStatus.read,
        ),
        MessageModel(
          id: '5',
          chatId: 'group_1',
          senderId: 'user_6',
          content: 'Happy Birthday Sarah!🎂💐',
          timestamp: DateTime.now().subtract(const Duration(minutes: 13)),
          status: MessageStatus.read,
        ),
        MessageModel(
          id: '6',
          chatId: 'group_1',
          senderId: 'user_7',
          content: 'Happy Birthday Sarah! 🎂🎂',
          timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
          status: MessageStatus.read,
        ),
      ];
      isLoading.value = false;
    });
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    final newMessage = MessageModel(
      id: DateTime.now().toString(),
      chatId: 'group_1',
      senderId: MockDataProvider.currentUserId,
      content: messageController.text,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
    );

    messages.insert(0, newMessage);
    messageController.clear();
  }

  void openGroupInfo() {
    Get.toNamed(AppRoutes.GROUP_INFO);
  }

  Color getMemberColor(String userId) {
    // Simple hash to get a consistent color for a user
    final colors = [
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.pink,
      Colors.teal,
    ];
    return colors[userId.hashCode % colors.length];
  }

  UserModel? getUserById(String userId) {
    final users = MockDataProvider.getMockUsers();
    try {
      return users.firstWhere((u) => u.id == userId);
    } catch (e) {
      return null;
    }
  }

  String getMemberName(String userId) {
    final user = getUserById(userId);
    return user?.name ?? 'Unknown';
  }

  String getParticipantNames() {
    if (chat.value == null) return '';
    
    final otherParticipants = chat.value!.participantIds
        .where((id) => id != MockDataProvider.currentUserId)
        .toList();
    
    final participantNames = otherParticipants
        .map((id) => getMemberName(id))
        .where((name) => name != 'Unknown')
        .take(4)
        .toList();
    
    if (participantNames.isEmpty) {
      return 'No participants';
    }
    
    final remainingCount = otherParticipants.length - participantNames.length;
    if (remainingCount > 0) {
      return '${participantNames.join(', ')}...';
    }
    return participantNames.join(', ');
  }
}
