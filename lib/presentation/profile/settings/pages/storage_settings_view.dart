import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';
import '../../../../core/widgets/settings_item.dart';
import '../../../../core/constants/app_constants.dart';

class StorageSettingsView extends GetView<SettingsController> {
  const StorageSettingsView({super.key});

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
          'Storage and data',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        children: [
          _buildSectionHeader('Storage'),
          const SizedBox(height: AppSizes.spacing8),
          SettingsItem(
            title: 'Manage storage',
            icon: CupertinoIcons.arrow_down_circle,
            onTap: () => Get.snackbar('Storage', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          _buildSectionHeader('Network'),
          const SizedBox(height: AppSizes.spacing8),
          SettingsItem(
            title: 'Network usage',
            icon: CupertinoIcons.wifi,
            onTap: () => Get.snackbar('Network', AppStrings.featureComingSoon),
          ),
          Obx(() => SettingsSwitchItem(
                title: 'Use less data for calls',
                value: controller.useLessDataForCalls.value,
                onChanged: (val) => controller.useLessDataForCalls.value = val,
                icon: CupertinoIcons.phone,
              )),
          SettingsItem(
            title: 'Proxy',
            icon: CupertinoIcons.shield,
            onTap: () => Get.snackbar('Proxy', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          _buildSectionHeader('Media quality'),
          const SizedBox(height: AppSizes.spacing8),
          SettingsItem(
            title: 'Upload quality',
            value: 'Standard',
            icon: CupertinoIcons.arrow_up_circle,
            onTap: () => Get.snackbar('Quality', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Auto-download quality',
            icon: CupertinoIcons.arrow_down_circle,
            onTap: () => Get.snackbar('Quality', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          _buildSectionHeader('Media auto-download'),
          const SizedBox(height: AppSizes.spacing8),
          SettingsItem(
            title: 'Photos',
            value: 'Wi-Fi and cellular',
            icon: CupertinoIcons.photo,
            onTap: () => Get.snackbar('Photos', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Audio',
            value: 'Wi-Fi',
            icon: CupertinoIcons.music_note,
            onTap: () => Get.snackbar('Audio', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Video',
            value: 'Wi-Fi',
            icon: CupertinoIcons.videocam,
            onTap: () => Get.snackbar('Video', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Documents',
            value: 'Wi-Fi',
            icon: CupertinoIcons.doc,
            onTap: () => Get.snackbar('Documents', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Reset auto-download settings',
            titleColor: Colors.orange,
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
