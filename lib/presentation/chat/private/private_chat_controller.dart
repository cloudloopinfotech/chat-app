import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/chat_model.dart';
import '../../../data/models/message_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/chat_repository.dart';
import '../../../data/providers/mock_data_provider.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_constants.dart';

class PrivateChatController extends GetxController {
  final ChatRepository _chatRepository = ChatRepository();

  final messageController = TextEditingController();
  final messages = <MessageModel>[].obs;
  final isLoading = false.obs;
  final isTyping = false.obs;

  late ChatModel chat;
  late UserModel otherUser;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    chat = args['chat'] as ChatModel;
    _loadOtherUser();
    _loadMessages();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void _loadOtherUser() {
    final otherUserId = chat.participantIds.firstWhere(
      (id) => id != MockDataProvider.currentUserId,
    );
    final user = MockDataProvider.getUserById(otherUserId);
    if (user != null) {
      otherUser = user;
    } else {
      otherUser = UserModel(
        id: otherUserId,
        username: 'unknown',
        email: '',
        name: AppStrings.offline,
        avatar: 'https://ui-avatars.com/api/?name=Unknown+User',
        status: '',
        bio: '',
        isOnline: false,
        createdAt: DateTime.now(),
      );
    }
  }

  Future<void> _loadMessages() async {
    isLoading.value = true;
    try {
      final result = await _chatRepository.getMessages(chat.id);
      messages.value = result;
      await _chatRepository.markAsRead(chat.id);
    } catch (e) {
      Get.snackbar(AppStrings.error, AppStrings.networkError);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    messageController.clear();

    try {
      final message = await _chatRepository.sendMessage(
        chatId: chat.id,
        content: text,
      );
      messages.add(message);
    } catch (e) {
      Get.snackbar(AppStrings.error, AppStrings.networkError);
    }
  }

  Future<void> deleteMessage(String messageId) async {
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: Text(AppStrings.deleteMessage),
        content: Text(AppStrings.deleteMessageConfirm),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(AppStrings.delete,
                style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _chatRepository.deleteMessage(messageId, chat.id);
      messages.removeWhere((m) => m.id == messageId);
    }
  }

  Future<void> addReaction(String messageId, String emoji) async {
    await _chatRepository.addReaction(
      messageId: messageId,
      chatId: chat.id,
      emoji: emoji,
    );
    await _loadMessages();
  }

  void showMessageOptions(MessageModel message) {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.reply),
              title: Text(AppStrings.send),
              onTap: () {
                Get.back();
                // Implement reply
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: Text(AppStrings.copy),
              onTap: () {
                Get.back();
                // Implement copy
              },
            ),
            ListTile(
              leading: const Icon(Icons.forward),
              title: Text(AppStrings.share),
              onTap: () {
                Get.back();
                // Implement forward
              },
            ),
            if (message.senderId == MockDataProvider.currentUserId)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: Text(AppStrings.delete,
                    style: const TextStyle(color: Colors.red)),
                onTap: () {
                  Get.back();
                  messages.remove(message);
                },
              ),
          ],
        ),
      ),
    );
  }

  void showAttachmentMenu() {
    Get.bottomSheet(
      Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2C34), // Dark background color
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAttachmentItem(
                  icon: Icons.insert_photo,
                  color: Colors.purple,
                  label: AppStrings.media,
                  onTap: () => Get.snackbar(
                      AppStrings.media, AppStrings.featureComingSoon),
                ),
                _buildAttachmentItem(
                  icon: Icons.camera_alt,
                  color: Colors.pink,
                  label: AppStrings.video,
                  onTap: () => Get.snackbar(
                      AppStrings.video, AppStrings.featureComingSoon),
                ),
                _buildAttachmentItem(
                  icon: Icons.location_on,
                  color: Colors.green,
                  label: AppStrings.location,
                  onTap: () => Get.snackbar(
                      AppStrings.location, AppStrings.featureComingSoon),
                ),
                _buildAttachmentItem(
                  icon: Icons.person,
                  color: Colors.blue,
                  label: AppStrings.contact,
                  onTap: () => Get.snackbar(
                      AppStrings.contact, AppStrings.featureComingSoon),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildAttachmentItem(
                  icon: Icons.insert_drive_file,
                  color: Colors.indigo,
                  label: AppStrings.docs,
                  onTap: () => Get.snackbar(
                      AppStrings.docs, AppStrings.featureComingSoon),
                ),
                _buildAttachmentItem(
                  icon: Icons.poll,
                  color: Colors.orange,
                  label: 'Poll',
                  onTap: () => Get.snackbar(
                      AppStrings.comingSoon, AppStrings.featureComingSoon),
                ),
                _buildAttachmentItem(
                  icon: Icons.event,
                  color: Colors.red,
                  label: AppStrings.comingSoon,
                  onTap: () => Get.snackbar(
                      AppStrings.comingSoon, AppStrings.featureComingSoon),
                ),
                _buildAttachmentItem(
                  icon: Icons.currency_rupee,
                  color: Colors.teal,
                  label: AppStrings.pay,
                  onTap: () => Get.snackbar(
                      AppStrings.pay, AppStrings.featureComingSoon),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12), // Align with first column
                _buildAttachmentItem(
                  icon: Icons.image,
                  color: Colors.blueAccent,
                  label: AppStrings.media,
                  onTap: () => Get.snackbar(
                      AppStrings.media, AppStrings.featureComingSoon),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF1F2C34), // Match container color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _buildAttachmentItem({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        Get.back();
        onTap();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color, // Use the specific color for the circle
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void openContactInfo() {
    Get.toNamed(AppRoutes.CONTACT_INFO, arguments: {
      'user': otherUser,
      'chat': chat,
    });
  }
}
