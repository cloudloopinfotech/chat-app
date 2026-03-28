import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'editprofile_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/constants/app_constants.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

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
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.spacing16),
        child: Column(
          children: [
            const SizedBox(height: AppSizes.spacing32),
            // Profile Picture Section
            Stack(
              children: [
                GlassContainer(
                  width: 140,
                  height: 140,
                  borderRadius: BorderRadius.circular(70),
                  blur: 20,
                  opacity: 0.2,
                  color: Colors.white,
                  child: const AvatarWidget(
                    imageUrl:
                        'https://ui-avatars.com/api/?name=John+Doe&background=0D8ABC&color=fff',
                    name: 'John Doe',
                    size: 140,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GlassContainer(
                    width: 44,
                    height: 44,
                    borderRadius: BorderRadius.circular(22),
                    blur: 15,
                    opacity: 0.3,
                    color: AppColors.primary,
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.camera,
                        color: Colors.black,
                        size: 22,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spacing32),
            // Profile Items
            _buildProfileItem(
              icon: CupertinoIcons.person,
              label: 'Name',
              value: 'John Doe',
              onTap: () {},
            ),
            const SizedBox(height: AppSizes.spacing12),
            _buildProfileItem(
              icon: CupertinoIcons.info_circle,
              label: 'About',
              value: 'Flutter Developer',
              onTap: () {},
            ),
            const SizedBox(height: AppSizes.spacing12),
            _buildProfileItem(
              icon: CupertinoIcons.phone,
              label: 'Phone',
              value: '+1 555 123 4567',
              onTap: () {},
            ),
            const SizedBox(height: AppSizes.spacing80),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.spacing16),
      borderRadius: BorderRadius.circular(AppSizes.radiusM),
      blur: 15,
      opacity: 0.15,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.spacing10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusS),
            ),
            child: Icon(icon, color: Colors.white, size: AppSizes.iconSizeM),
          ),
          const SizedBox(width: AppSizes.spacing16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeS,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppSizes.spacing4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: AppSizes.fontSizeM,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
