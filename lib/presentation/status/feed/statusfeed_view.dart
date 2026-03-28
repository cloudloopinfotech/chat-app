import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'statusfeed_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/constants/app_constants.dart';

class StatusFeedView extends GetView<StatusFeedController> {
  const StatusFeedView({super.key});

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
                  // Top row with menu button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlassContainer(
                        width: 40,
                        height: 40,
                        borderRadius: BorderRadius.circular(20),
                        blur: 15,
                        opacity: 0.2,
                        color: Colors.white,
                        child: IconButton(
                          icon: const Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white, size: 20),
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: AppSizes.spacing8),
                    child: Text(
                      AppStrings.status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
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

            // Status List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
                children: [
                  // Status Section Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.spacing8),
                    child: Text(
                      AppStrings.status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.fontSizeXL,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Add Status Card
                  GlassCard(
                    padding: const EdgeInsets.all(AppSizes.spacing16),
                    margin: const EdgeInsets.only(bottom: AppSizes.spacing16),
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    blur: 15,
                    opacity: 0.15,
                    onTap: () => _showPhotoPickerBottomSheet(context),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            const AvatarWidget(
                              imageUrl: 'https://i.pravatar.cc/150?img=1',
                              name: 'My Status',
                              size: 56,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GlassContainer(
                                width: 24,
                                height: 24,
                                borderRadius: BorderRadius.circular(12),
                                blur: 10,
                                opacity: 0.4,
                                color: AppColors.primary,
                                child: const Icon(
                                  CupertinoIcons.add,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: AppSizes.spacing16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add status',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSizes.fontSizeL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: AppSizes.spacing4),
                              Text(
                                'Disappears after 24 hours',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: AppSizes.fontSizeS,
                                ),
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
                            icon: const Icon(CupertinoIcons.camera, color: Colors.white, size: 22),
                            onPressed: () => _showPhotoPickerBottomSheet(context),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.spacing8),
                        GlassContainer(
                          width: 40,
                          height: 40,
                          borderRadius: BorderRadius.circular(20),
                          blur: 15,
                          opacity: 0.2,
                          color: Colors.white,
                          child: IconButton(
                            icon: const Icon(CupertinoIcons.pencil, color: Colors.white, size: 22),
                            onPressed: () => Get.toNamed('/text-status'),
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

                  // Recent Updates Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.spacing8),
                    child: Text(
                      'Recent updates',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: AppSizes.fontSizeS,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Recent Status Updates
                  _buildStatusItem(
                    name: 'Olivia Martinez',
                    time: '17m ago',
                    imageUrl: 'https://i.pravatar.cc/150?img=2',
                    isViewed: false,
                  ),
                  _buildStatusItem(
                    name: 'Robert Anderson',
                    time: '12h ago',
                    imageUrl: 'https://i.pravatar.cc/150?img=3',
                    isViewed: false,
                  ),
                  _buildStatusItem(
                    name: 'Sophia Williams',
                    time: '16h ago',
                    imageUrl: 'https://i.pravatar.cc/150?img=4',
                    isViewed: false,
                  ),
                  _buildStatusItem(
                    name: 'Michael Thompson',
                    time: '9h ago',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    isViewed: false,
                  ),
                  _buildStatusItem(
                    name: 'Dr. Emma Johnson',
                    time: '2m ago',
                    imageUrl: 'https://i.pravatar.cc/150?img=6',
                    isViewed: false,
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

  Widget _buildStatusItem({
    required String name,
    required String time,
    required String imageUrl,
    required bool isViewed,
  }) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/status-viewer',
          arguments: {
            'userName': name,
            'userAvatar': imageUrl,
            'statusTime': time,
            'statusUrl':
                'https://picsum.photos/400/800?random=${name.hashCode}',
          },
        );
      },
      child: GlassCard(
        padding: const EdgeInsets.all(AppSizes.spacing12),
        margin: const EdgeInsets.only(bottom: AppSizes.spacing8),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        blur: 10,
        opacity: 0.1,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isViewed ? Colors.grey[700]! : AppColors.primary,
                  width: 3,
                ),
              ),
              child: AvatarWidget(
                imageUrl: imageUrl,
                name: name,
                size: 52,
              ),
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: AppSizes.spacing4),
                  Text(
                    time,
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
      ),
    );
  }

  void _showPhotoPickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Row(
                    children: [
                      GlassContainer(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spacing16,
                          vertical: AppSizes.spacing8,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        blur: 15,
                        opacity: 0.3,
                        color: AppColors.primary,
                        child: const Text(
                          'Photos',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: AppSizes.spacing8),
                      GlassContainer(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spacing16,
                          vertical: AppSizes.spacing8,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        blur: 10,
                        opacity: 0.15,
                        color: Colors.white,
                        child: Text(
                          'Albums',
                          style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Options Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPickerOption(CupertinoIcons.textformat, 'Text', () {
                    Navigator.pop(context);
                    Get.toNamed('/text-status');
                  }),
                  _buildPickerOption(CupertinoIcons.music_note, 'Music', () {}),
                  _buildPickerOption(CupertinoIcons.square_grid_2x2, 'Layout', () {}),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Camera Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
              child: GlassCard(
                padding: const EdgeInsets.all(AppSizes.spacing16),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                blur: 15,
                opacity: 0.2,
                onTap: () {
                  Navigator.pop(context);
                  // Open camera
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.camera, color: Colors.white, size: 28),
                    SizedBox(width: AppSizes.spacing12),
                    Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.fontSizeL,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Photo Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://picsum.photos/200/200?random=$index',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[800],
                                child: const Icon(CupertinoIcons.photo, color: Colors.grey),
                              );
                            },
                          ),
                        ),
                        if (index == 0)
                          Positioned(
                            bottom: 4,
                            left: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Row(
                                children: [
                                  Icon(CupertinoIcons.play_fill,
                                      color: Colors.white, size: 12),
                                  Text(
                                    '0:32',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
          ),
        ),
      ),
    );
  }

  Widget _buildPickerOption(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          GlassContainer(
            width: 64,
            height: 64,
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
            blur: 15,
            opacity: 0.2,
            color: Colors.white,
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(height: AppSizes.spacing8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppSizes.fontSizeS,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
