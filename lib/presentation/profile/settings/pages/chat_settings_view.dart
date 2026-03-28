import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';
import '../../../../core/widgets/settings_item.dart';
import '../../../../core/constants/app_constants.dart';

class ChatSettingsView extends GetView<SettingsController> {
  const ChatSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        children: [
          SettingsItem(
            title: 'Default chat theme',
            icon: CupertinoIcons.paintbrush,
            onTap: () => Get.snackbar('Theme', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Animations',
            subtitle:
                'Choose whether emoji, stickers and GIFs move automatically.',
            icon: CupertinoIcons.play_circle,
            onTap: () => Get.snackbar('Animations', AppStrings.featureComingSoon),
          ),
          Obx(() => SettingsSwitchItem(
                title: 'Save to Photos',
                subtitle:
                    'Automatically save photos and videos you receive to Photos.',
                value: controller.saveToPhotos.value,
                onChanged: (val) => controller.saveToPhotos.value = val,
                icon: CupertinoIcons.photo,
              )),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Chat backup',
            icon: CupertinoIcons.cloud,
            onTap: () => Get.snackbar('Chat backup', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Export chat',
            icon: CupertinoIcons.arrow_up_doc,
            onTap: () => Get.snackbar('Export chat', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Voice message transcripts',
            icon: CupertinoIcons.mic,
            onTap: () => Get.snackbar('Transcripts', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          Obx(() => SettingsSwitchItem(
                title: 'Keep chats archived',
                subtitle:
                    'Archived chats will remain archived when you receive a new message.',
                value: controller.keepChatsArchived.value,
                onChanged: (val) => controller.keepChatsArchived.value = val,
                icon: CupertinoIcons.archivebox,
              )),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Move chats to Android',
            titleColor: Colors.green,
            icon: CupertinoIcons.arrow_right_circle,
            onTap: () => Get.snackbar('Move to Android', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Transfer chats to iPhone',
            titleColor: Colors.green,
            icon: CupertinoIcons.arrow_left_right_circle,
            onTap: () =>
                Get.snackbar('Transfer to iPhone', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Archive all chats',
            titleColor: Colors.green,
            icon: CupertinoIcons.archivebox_fill,
            onTap: () => Get.snackbar('Archive all', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Clear all chats',
            titleColor: Colors.red,
            icon: CupertinoIcons.clear,
            onTap: () => Get.snackbar('Clear all', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Delete all chats',
            titleColor: Colors.red,
            icon: CupertinoIcons.delete,
            onTap: () => Get.snackbar('Delete all', AppStrings.featureComingSoon),
                ),
          const SizedBox(height: AppSizes.spacing80),
        ],
      ),
    );
  }
}
