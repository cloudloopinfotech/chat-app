import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/chat_model.dart';
import '../../../../data/models/user_model.dart';
import '../../../../core/constants/app_constants.dart';

class ContactInfoController extends GetxController {
  late UserModel user;
  late ChatModel chat;
  
  final isLocked = false.obs;
  final isDisappearingMessagesOn = false.obs;
  final isAdvancedPrivacyOn = false.obs;
  final mediaCount = 91.obs;
  final starredCount = 0.obs;
  
  // Mock groups in common
  final groupsInCommon = [
    {
      'name': 'Tech Innovation Hub',
      'avatar': 'https://i.pravatar.cc/150?img=10',
      'participants': ['Emma', 'Ethan', 'Grace', 'Henry', 'Lucas', 'Lily...'],
    },
    {
      'name': 'Design Team',
      'avatar': 'https://i.pravatar.cc/150?img=11',
      'participants': ['Noah', 'Oliver', 'Isabella', 'Robert', 'Sophia', 'Mia...'],
    },
    {
      'name': 'Weekend Adventure Group',
      'avatar': 'https://i.pravatar.cc/150?img=12',
      'participants': ['Noah', 'Oliver', 'Isabella', 'Robert', 'Sophia', '~A', '~...'],
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    user = args['user'] as UserModel;
    chat = args['chat'] as ChatModel;
    _loadGroupsInCommon();
  }

  void _loadGroupsInCommon() {
    // In a real app, this would fetch groups where both current user and this user are members
    // For now, we use mock data
  }

  void toggleLock() {
    isLocked.toggle();
  }

  void toggleDisappearingMessages() {
    isDisappearingMessagesOn.toggle();
  }

  void toggleAdvancedPrivacy() {
    isAdvancedPrivacyOn.toggle();
  }

  void makeAudioCall() {
    Get.snackbar('Call', 'Audio call feature coming soon');
  }

  void makeVideoCall() {
    Get.snackbar('Call', 'Video call feature coming soon');
  }

  void makePayment() {
    Get.snackbar('Payment', 'Payment feature coming soon');
  }

  void searchChat() {
    Get.snackbar('Search', 'Search feature coming soon');
  }

  void openMedia() {
    Get.toNamed('/media-gallery', arguments: {'chatId': chat.id});
  }

  void openStarred() {
    Get.snackbar('Starred', 'Starred messages feature coming soon');
  }

  void openNotifications() {
    Get.snackbar('Notifications', 'Notification settings feature coming soon');
  }

  void openChatTheme() {
    Get.snackbar('Theme', 'Chat theme feature coming soon');
  }

  void openContactDetails() {
    Get.snackbar('Contact', 'Contact details feature coming soon');
  }

  void shareContact() {
    Get.snackbar('Share', 'Share contact feature coming soon');
  }

  void addToFavourites() {
    Get.snackbar(AppStrings.favourites, AppStrings.featureComingSoon);
  }

  void addToList() {
    Get.snackbar(AppStrings.addToList, AppStrings.featureComingSoon);
  }

  void exportChat() {
    Get.snackbar(AppStrings.exportChat, AppStrings.featureComingSoon);
  }

  void clearChat() {
    Get.dialog(
      AlertDialog(
        title: Text(AppStrings.clearChat),
        content: Text(AppStrings.clearChatConfirm),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(AppStrings.success, AppStrings.chatCleared);
            },
            child: Text(AppStrings.clear, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void blockUser() {
    Get.dialog(
      AlertDialog(
        title: Text('${AppStrings.block} ${user.name}'),
        content: Text(AppStrings.blockUserConfirm),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(AppStrings.userBlocked, '${user.name} ${AppStrings.userBlocked.toLowerCase()}');
            },
            child: Text(AppStrings.block, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void reportUser() {
    Get.dialog(
      AlertDialog(
        title: Text('${AppStrings.report} ${user.name}'),
        content: Text(AppStrings.reportUserConfirm),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(AppStrings.report, AppStrings.success);
            },
            child: Text(AppStrings.report, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void createGroupWithUser() {
    Get.snackbar(AppStrings.groups, AppStrings.featureComingSoon);
  }

  String getPhoneNumber() {
    // In a real app, this would come from the user model
    // For now, we'll use a mock phone number based on user ID
    return '+91 90168 57057'; // Mock phone number
  }
}

