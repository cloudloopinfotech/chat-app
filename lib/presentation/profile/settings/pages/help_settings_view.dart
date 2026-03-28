import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/app_logo.dart';

class HelpSettingsView extends GetView<SettingsController> {
  const HelpSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: AppLogo(
                        size: 80,
                    showGradient: true,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    AppStrings.appName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    // Wrapped Text in GestureDetector to allow onTap
                    onTap: () {
                      Get.back();
                      controller
                          .showAppInfo(); // Changed _showAppInfo to showAppInfo
                    },
                    child: const Text(
                      'Version 2.25.34.75',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _buildSettingItem(
                  title: 'Help Center',
                  subtitle: 'Get help, contact us',
                  onTap: () =>
                      Get.snackbar('Help Center', 'Feature coming soon'),
                ),
                _buildSettingItem(
                  title: 'Send feedback',
                  subtitle: 'Report technical issues',
                  onTap: () => Get.snackbar('Feedback', 'Feature coming soon'),
                ),
                _buildSettingItem(
                  title: 'Terms and Privacy Policy',
                  onTap: () => Get.snackbar('Terms', 'Feature coming soon'),
                ),
                _buildSettingItem(
                  title: 'Channel reports',
                  onTap: () =>
                      Get.snackbar('Channel reports', 'Feature coming soon'),
                ),
                _buildSettingItem(
                  title: 'Licenses',
                  onTap: () => Get.snackbar('Licenses', 'Feature coming soon'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:             Text(
              '© 2025 ${AppStrings.appName}. All rights reserved.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[600], size: 24),
          ],
        ),
      ),
    );
  }
}
