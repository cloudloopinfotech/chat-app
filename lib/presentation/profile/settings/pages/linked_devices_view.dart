import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../../core/widgets/glass_container.dart';

class LinkedDevicesView extends GetView<SettingsController> {
  const LinkedDevicesView({super.key});

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
          'Linked devices',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: AppSizes.spacing32),
          // Illustration
          GlassContainer(
            width: 120,
            height: 120,
            borderRadius: BorderRadius.circular(60),
            blur: 15,
            opacity: 0.2,
            color: Colors.white,
            child: Icon(
              CupertinoIcons.device_desktop,
              size: 60,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSizes.spacing24),
          Text(
            'Use ${AppStrings.appName} on other devices',
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppSizes.fontSizeXL,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.spacing8),
          TextButton(
            onPressed: () => Get.snackbar('Learn more', 'Opening help...'),
            child: Text(
              'Learn more',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: AppSizes.fontSizeM,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spacing24),
          // Link Device Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
            child: GlassCard(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.spacing16),
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
              blur: 15,
              opacity: 0.3,
              color: AppColors.primary,
              onTap: () => Get.snackbar('Link', 'Linking device...'),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.add_circled,
                    color: Colors.black,
                    size: 24,
                  ),
                  SizedBox(width: AppSizes.spacing8),
                  Text(
                    'Link a device',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSizes.fontSizeL,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spacing16),
          TextButton(
            onPressed: () => Get.snackbar('How to', 'Opening tutorial...'),
            child: Text(
              'How do I get started?',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: AppSizes.fontSizeM,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spacing24),
          // Linked Devices Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Linked devices',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: AppSizes.fontSizeS,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spacing12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
              children: [
                _buildDeviceItem(
                  icon: CupertinoIcons.device_desktop,
                  name: 'Google Chrome (Windows)',
                  status: 'Keep app open on both devices',
                  color: Colors.orange,
                ),
                const SizedBox(height: AppSizes.spacing8),
                _buildDeviceItem(
                  icon: CupertinoIcons.device_desktop,
                  name: 'macOS',
                  status: 'Keep app open on both devices',
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.spacing16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.lock,
                  size: 14,
                  color: Colors.grey[500],
                ),
                const SizedBox(width: AppSizes.spacing8),
                Expanded(
                  child: Text(
                    'Your personal messages are end-to-end encrypted on all of your devices.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: AppSizes.fontSizeXS,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.spacing32),
        ],
      ),
    );
  }

  Widget _buildDeviceItem({
    required IconData icon,
    required String name,
    required String status,
    required Color color,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.spacing16),
      borderRadius: BorderRadius.circular(AppSizes.radiusM),
      blur: 10,
      opacity: 0.15,
      onTap: () => Get.snackbar('Device', 'Managing device...'),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: AppSizes.spacing16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.fontSizeM,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSizes.spacing4),
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: AppSizes.fontSizeS,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            CupertinoIcons.chevron_right,
            color: Colors.grey[500],
            size: AppSizes.iconSizeS,
          ),
        ],
      ),
    );
  }
}
