import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';
import '../../../../core/widgets/settings_item.dart';
import '../../../../core/constants/app_constants.dart';

class NotificationSettingsView extends GetView<SettingsController> {
  const NotificationSettingsView({super.key});

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
          AppStrings.notifications,
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        children: [
          _buildSectionHeader('Message notifications'),
          const SizedBox(height: AppSizes.spacing8),
          Obx(() => SettingsSwitchItem(
                title: 'Show notifications',
                value: controller.showMessageNotifications.value,
                onChanged: (val) =>
                    controller.showMessageNotifications.value = val,
                icon: CupertinoIcons.bell,
              )),
          SettingsItem(
            title: 'Sound',
            value: 'Note',
            icon: CupertinoIcons.music_note,
            onTap: () => Get.snackbar('Sound', AppStrings.featureComingSoon),
          ),
          Obx(() => SettingsSwitchItem(
                title: 'Reaction notifications',
                value: controller.showMessageReactions.value,
                onChanged: (val) => controller.showMessageReactions.value = val,
                icon: CupertinoIcons.smiley,
              )),
          const SizedBox(height: AppSizes.spacing16),
          _buildSectionHeader('Group notifications'),
          const SizedBox(height: AppSizes.spacing8),
          Obx(() => SettingsSwitchItem(
                title: 'Show notifications',
                value: controller.showGroupNotifications.value,
                onChanged: (val) =>
                    controller.showGroupNotifications.value = val,
                icon: CupertinoIcons.group,
              )),
          SettingsItem(
            title: 'Sound',
            value: 'Note',
            icon: CupertinoIcons.music_note,
            onTap: () => Get.snackbar('Sound', AppStrings.featureComingSoon),
          ),
          Obx(() => SettingsSwitchItem(
                title: 'Reaction notifications',
                value: controller.showGroupReactions.value,
                onChanged: (val) => controller.showGroupReactions.value = val,
                icon: CupertinoIcons.smiley,
              )),
          const SizedBox(height: AppSizes.spacing16),
          _buildSectionHeader('Status notifications'),
          const SizedBox(height: AppSizes.spacing8),
          Obx(() => SettingsSwitchItem(
                title: 'Show notifications',
                value: controller.showStatusNotifications.value,
                onChanged: (val) =>
                    controller.showStatusNotifications.value = val,
                icon: CupertinoIcons.circle,
              )),
          SettingsItem(
            title: 'Sound',
            icon: CupertinoIcons.music_note,
            onTap: () => Get.snackbar('Sound', AppStrings.featureComingSoon),
          ),
          Obx(() => SettingsSwitchItem(
                title: 'Reaction notifications',
                value: controller.showStatusReactions.value,
                onChanged: (val) => controller.showStatusReactions.value = val,
                icon: CupertinoIcons.smiley,
              )),
          const SizedBox(height: AppSizes.spacing16),
          Obx(() => SettingsSwitchItem(
                title: 'Reminders',
                subtitle:
                    'Get occasional reminders about messages, calls or status updates you haven\'t seen.',
                value: controller.showReminders.value,
                onChanged: (val) => controller.showReminders.value = val,
                icon: CupertinoIcons.clock,
              )),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'In-app notifications',
            subtitle: 'Banners, Sounds, Vibrate',
            icon: CupertinoIcons.bell,
            onTap: () => Get.snackbar('In-app', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          Obx(() => SettingsSwitchItem(
                title: 'Show preview',
                subtitle:
                    'Preview message text inside new message notifications.',
                value: controller.showPreview.value,
                onChanged: (val) => controller.showPreview.value = val,
                icon: CupertinoIcons.eye,
              )),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Reset notification settings',
            titleColor: Colors.red,
            subtitle:
                'Reset all notification settings, including custom notification settings for your chats.',
            icon: CupertinoIcons.arrow_counterclockwise,
            onTap: () => Get.snackbar('Reset', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing80),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSizes.spacing8,
        bottom: AppSizes.spacing4,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: AppSizes.fontSizeS,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
