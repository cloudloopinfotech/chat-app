import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';
import '../../../../core/widgets/settings_item.dart';
import '../../../../core/constants/app_constants.dart';

class AccountSettingsView extends GetView<SettingsController> {
  const AccountSettingsView({super.key});

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
          'Account',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        children: [
          SettingsItem(
            title: 'Security notifications',
            icon: CupertinoIcons.bell,
            onTap: () => Get.snackbar('Security', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Two-step verification',
            icon: CupertinoIcons.shield,
            onTap: () => Get.snackbar('Two-step', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Email address',
            icon: CupertinoIcons.mail,
            onTap: () => Get.snackbar('Email', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Passkeys',
            icon: CupertinoIcons.lock_shield,
            onTap: () => Get.snackbar('Passkeys', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Change phone number',
            icon: CupertinoIcons.phone,
            onTap: () => Get.snackbar('Change Number', AppStrings.featureComingSoon),
          ),
          const SizedBox(height: AppSizes.spacing16),
          SettingsItem(
            title: 'Request account info',
            icon: CupertinoIcons.doc_text,
            onTap: () => Get.snackbar('Account Info', AppStrings.featureComingSoon),
          ),
          SettingsItem(
            title: 'Delete my account',
            icon: CupertinoIcons.delete,
            titleColor: Colors.red,
            onTap: controller.showDeleteAccountDialog,
          ),
          const SizedBox(height: AppSizes.spacing80),
        ],
      ),
    );
  }
}
