import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_constants.dart';

class SettingsController extends GetxController {
  final isLoading = false.obs;
  final isDarkMode = false.obs;
  final notificationsEnabled = true.obs;
  final selectedLanguage = 'English'.obs;
  final readReceipts = true.obs;
  final allowCameraEffects = false.obs;
  final saveToPhotos = false.obs;
  final keepChatsArchived = true.obs;

  // Notification Settings Observables
  final showMessageNotifications = true.obs;
  final showMessageReactions = true.obs;
  final showGroupNotifications = true.obs;
  final showGroupReactions = true.obs;
  final showStatusNotifications = true.obs;
  final showStatusReactions = true.obs;
  final showReminders = true.obs;
  final showPreview = true.obs;

  // Storage Settings Observables
  final useLessDataForCalls = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  void _loadSettings() {
    // Load saved settings from local storage
    // For now using mock data
  }

  // Account Settings
  void openAccountSettings() {
    Get.toNamed(AppRoutes.ACCOUNT_SETTINGS);
  }

  void showDeleteAccountDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Account?'),
        content: const Text(
          'This will delete your account and all your data. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Account Deletion',
                'Feature will be implemented with backend',
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  // Privacy Settings
  void openPrivacySettings() {
    Get.toNamed(AppRoutes.PRIVACY_SETTINGS);
  }

  void showPrivacyOption(String setting) {
    Get.dialog(
      AlertDialog(
        title: Text('Who can see your $setting'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: const Text('Everyone'),
              value: 'everyone',
              groupValue: 'everyone',
              onChanged: (value) => Get.back(),
            ),
            RadioListTile(
              title: const Text('My contacts'),
              value: 'contacts',
              groupValue: 'everyone',
              onChanged: (value) => Get.back(),
            ),
            RadioListTile(
              title: const Text('Nobody'),
              value: 'nobody',
              groupValue: 'everyone',
              onChanged: (value) => Get.back(),
            ),
          ],
        ),
      ),
    );
  }

  // Chat Settings
  void openChatSettings() {
    Get.toNamed(AppRoutes.CHAT_SETTINGS);
  }

  // Notification Settings
  void openNotificationSettings() {
    Get.toNamed(AppRoutes.NOTIFICATION_SETTINGS);
  }

  // Storage Settings
  void openStorageSettings() {
    Get.toNamed(AppRoutes.STORAGE_SETTINGS);
  }

  // Language Settings
  void openLanguageSettings() {
    final languages = [
      {'name': 'English', 'code': 'en'},
      {'name': 'Hindi', 'code': 'hi'},
      {'name': 'Spanish', 'code': 'es'},
      {'name': 'French', 'code': 'fr'},
      {'name': 'German', 'code': 'de'},
    ];

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
          mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'App Language',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.xmark, color: Colors.white),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.white24, height: 1),
                  // Language List
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        final lang = languages[index];
                        return Obx(() {
                          final isSelected = selectedLanguage.value == lang['name'];
                          return InkWell(
                            onTap: () {
                              selectedLanguage.value = lang['name']!;
                    Get.back();
                    Get.snackbar(
                      'Language Changed',
                                'App language set to ${lang['name']}',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.black87,
                                colorText: Colors.white,
                    );
                  },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      lang['name']!,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey[300],
                                        fontSize: 16,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  if (isSelected)
                                    const Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Help Settings
  void openHelpSettings() {
    Get.toNamed(AppRoutes.HELP_SETTINGS);
  }

  void showAppInfo() {
    Get.dialog(
      AlertDialog(
        title: const Text('App Info'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.appName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Version: ${AppStrings.appVersion}'),
            Text('Build: 100'),
            SizedBox(height: 16),
            Text('© 2025 ${AppStrings.appName}. All rights reserved.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Invite Friend
  void inviteFriend() {
    Get.toNamed(AppRoutes.INVITE_FRIEND);
  }

  // QR Code
  void openQrCode() {
    Get.toNamed(AppRoutes.QR_CODE);
  }

  // Linked Devices
  void openLinkedDevices() {
    Get.toNamed(AppRoutes.LINKED_DEVICES);
  }

  // Starred Messages
  void openStarredMessages() {
    Get.toNamed(AppRoutes.STARRED_MESSAGES);
  }

  // Lists Settings
  void openListsSettings() {
    Get.toNamed(AppRoutes.LISTS_SETTINGS);
  }

  // Profile
  void openProfile() {
    Get.toNamed(AppRoutes.EDIT_PROFILE);
  }
}
