import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';
import '../../../../core/widgets/settings_item.dart';
import '../../../../core/constants/app_constants.dart';

class PrivacySettingsView extends GetView<SettingsController> {
  const PrivacySettingsView({super.key});

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
          'Privacy',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        children: [
          SettingsItem(
            title: 'Last seen & online',
            value: 'Nobody',
            icon: CupertinoIcons.eye,
            onTap: () => controller.showPrivacyOption('Last seen'),
          ),
          SettingsItem(
            title: 'Profile photo',
            value: 'Everyone',
            icon: CupertinoIcons.person_circle,
            onTap: () => controller.showPrivacyOption('Profile photo'),
          ),
          SettingsItem(
            title: 'About',
            value: 'My contacts',
            icon: CupertinoIcons.info_circle,
            onTap: () => controller.showPrivacyOption('About'),
          ),
          SettingsItem(
            title: 'Links',
            value: 'My contacts',
            icon: CupertinoIcons.link,
            onTap: () => controller.showPrivacyOption('Links'),
          ),
          SettingsItem(
            title: 'Groups',
            value: '586 Excluded',
            icon: CupertinoIcons.group,
            onTap: () => Get.snackbar('Groups', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Avatar stickers',
            value: 'My contacts',
            icon: CupertinoIcons.smiley,
            onTap: () => Get.snackbar('Avatar stickers', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Status',
            value: '0 Excluded',
            icon: CupertinoIcons.circle,
            onTap: () => Get.snackbar('Status', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Live location',
            value: 'None',
            subtitle: 'List of chats where you are sharing your live location.',
            icon: CupertinoIcons.location,
            onTap: () => Get.snackbar('Live location', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Calls',
            icon: CupertinoIcons.phone,
            onTap: () => Get.snackbar('Calls', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Contacts',
            icon: CupertinoIcons.person_2,
            onTap: () => Get.snackbar('Contacts', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          Obx(() => SettingsSwitchItem(
                title: 'Read receipts',
                subtitle:
                    'If you turn off read receipts, you won\'t be able to see read receipts from other people. Read receipts are always sent for group chats.',
                value: controller.readReceipts.value,
                onChanged: (val) => controller.readReceipts.value = val,
                icon: CupertinoIcons.check_mark_circled,
              )),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'App lock',
            subtitle:
                'To use App Lock, you need to set up Face ID on your iPhone. Go to iPhone Settings and tap Face ID & Passcode to get started.',
            icon: CupertinoIcons.lock,
            onTap: () => Get.snackbar('App lock', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Chat lock',
            icon: CupertinoIcons.lock_circle,
            onTap: () => Get.snackbar('Chat lock', AppStrings.featureComingSoon),
          ),
          Obx(() => SettingsSwitchItem(
                title: 'Allow camera effects',
                subtitle:
                    'Use effects in the camera and video calls. Learn more',
                value: controller.allowCameraEffects.value,
                onChanged: (val) => controller.allowCameraEffects.value = val,
                icon: CupertinoIcons.camera,
              )),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Advanced',
            icon: CupertinoIcons.settings,
            onTap: () => Get.snackbar('Advanced', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Privacy checkup',
            icon: CupertinoIcons.checkmark_shield,
            onTap: () => Get.snackbar('Privacy checkup', AppStrings.featureComingSoon),
                ),
          const SizedBox(height: AppSizes.spacing80),
        ],
      ),
    );
  }
}
