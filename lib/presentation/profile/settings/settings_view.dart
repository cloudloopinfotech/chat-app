import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/constants/app_constants.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.spacing16,
                AppSizes.spacing8,
                AppSizes.spacing16,
                AppSizes.spacing4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row (empty for now, can add menu button if needed)
                  const SizedBox(height: 32),
                  // Title
                  Text(
                    AppStrings.settings,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.spacing16,
                0,
                AppSizes.spacing16,
                AppSizes.spacing12,
              ),
              child: GlassContainer(
                height: 44,
                borderRadius: BorderRadius.circular(10),
                blur: 15,
                opacity: 0.2,
                color: Colors.white,
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 8),
                      child: Icon(
                        CupertinoIcons.search,
                        color: Colors.grey[500],
                        size: 20,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing12),

            // Settings List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
                children: [
                  // Profile Section
                  GlassCard(
                    padding: const EdgeInsets.all(AppSizes.spacing16),
                    margin: const EdgeInsets.only(bottom: AppSizes.spacing16),
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    blur: 15,
                    opacity: 0.15,
                    onTap: controller.openProfile,
                    child: Row(
                      children: [
                        const AvatarWidget(
                          imageUrl: 'https://i.pravatar.cc/150?img=1',
                          name: 'John Doe',
                          size: 56,
                        ),
                        const SizedBox(width: AppSizes.spacing16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSizes.fontSizeXL,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: AppSizes.spacing4),
                              Text(
                                'Act like a fool, Play like a...',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: AppSizes.fontSizeS,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        GlassContainer(
                          width: 40,
                          height: 40,
                          borderRadius: BorderRadius.circular(20),
                          blur: 15,
                          opacity: 0.2,
                          color: Colors.white,
                          child: IconButton(
                            icon: Icon(CupertinoIcons.qrcode, color: AppColors.primary, size: 22),
                            onPressed: controller.openQrCode,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Avatar
                  _buildSettingItem(
                    icon: CupertinoIcons.person_circle,
                    title: 'Avatar',
                    onTap: () => Get.snackbar('Avatar', AppStrings.featureComingSoon),
                  ),

                  const SizedBox(height: AppSizes.spacing16),

                  // Lists Section
                  _buildSectionHeader('Lists'),
                  const SizedBox(height: AppSizes.spacing8),
                  _buildSettingItem(
                    icon: CupertinoIcons.bookmark,
                    title: 'Lists',
                    onTap: controller.openListsSettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.antenna_radiowaves_left_right,
                    title: 'Broadcast messages',
                    onTap: () => Get.snackbar('Broadcast', AppStrings.featureComingSoon),
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.star,
                    title: AppStrings.starred,
                    onTap: controller.openStarredMessages,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.device_desktop,
                    title: 'Linked devices',
                    onTap: controller.openLinkedDevices,
                  ),

                  const SizedBox(height: AppSizes.spacing16),

                  // Main Settings
                  _buildSectionHeader('Settings'),
                  const SizedBox(height: AppSizes.spacing8),
                  _buildSettingItem(
                    icon: CupertinoIcons.person_crop_circle,
                    title: 'Account',
                    onTap: controller.openAccountSettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.lock,
                    title: 'Privacy',
                    onTap: controller.openPrivacySettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.chat_bubble,
                    title: AppStrings.chats,
                    onTap: controller.openChatSettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.bell,
                    title: AppStrings.notifications,
                    onTap: controller.openNotificationSettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.arrow_down_circle,
                    title: 'Storage and data',
                    onTap: controller.openStorageSettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.globe,
                    title: 'App language',
                    onTap: controller.openLanguageSettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.question_circle,
                    title: 'Help',
                    onTap: controller.openHelpSettings,
                  ),
                  _buildSettingItem(
                    icon: CupertinoIcons.person_add,
                    title: 'Invite a friend',
                    onTap: controller.inviteFriend,
                  ),
                  const SizedBox(height: AppSizes.spacing80),
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spacing16,
        vertical: AppSizes.spacing14,
      ),
      margin: const EdgeInsets.only(bottom: AppSizes.spacing6),
      borderRadius: BorderRadius.circular(AppSizes.radiusM),
      blur: 10,
      opacity: 0.1,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.spacing8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusS),
            ),
            child: Icon(icon, color: Colors.white, size: AppSizes.iconSizeM),
          ),
          const SizedBox(width: AppSizes.spacing16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppSizes.fontSizeM,
                fontWeight: FontWeight.w500,
              ),
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
