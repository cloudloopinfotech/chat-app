import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'callslist_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/constants/app_constants.dart';

class CallsListView extends GetView<CallsListController> {
  const CallsListView({super.key});

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
                  // Top row with menu and add button
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
                      GlassContainer(
                        width: 40,
                        height: 40,
                        borderRadius: BorderRadius.circular(20),
                        blur: 10,
                        opacity: 0.4,
                        color: AppColors.primary,
                        child: IconButton(
                          icon: const Icon(CupertinoIcons.add, color: Colors.black, size: 24),
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
                      AppStrings.calls,
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
            const SizedBox(height: AppSizes.spacing12),

            // Calls List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
                children: [
                  // Favourites Section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.spacing8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.favourites,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppSizes.fontSizeXL,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'More',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: AppSizes.fontSizeS,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildFavouriteItem(
                    name: 'David Miller',
                    imageUrl: 'https://i.pravatar.cc/150?img=1',
                  ),
                  const SizedBox(height: AppSizes.spacing16),

                  // Recent Section
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.spacing8),
                    child: const Text(
                      'Recent',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.fontSizeXL,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  _buildCallItem(
                    name: 'Michael Thompson',
                    time: 'Wednesday',
                    imageUrl: 'https://i.pravatar.cc/150?img=2',
                    isIncoming: true,
                    isMissed: false,
                    isVideo: true,
                  ),
                  _buildCallItem(
                    name: 'Sophia Williams',
                    time: '21-11-2025',
                    imageUrl: 'https://i.pravatar.cc/150?img=3',
                    isIncoming: true,
                    isMissed: false,
                    isVideo: false,
                  ),
                  _buildCallItem(
                    name: 'William Davis',
                    time: '14-11-2025',
                    imageUrl: 'https://i.pravatar.cc/150?img=4',
                    isIncoming: true,
                    isMissed: false,
                    isVideo: true,
                  ),
                  _buildCallItem(
                    name: 'William & Olivia',
                    time: '14-11-2025',
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    isIncoming: false,
                    isMissed: false,
                    isVideo: true,
                  ),
                  _buildCallItem(
                    name: 'William Davis',
                    time: '14-11-2025',
                    imageUrl: 'https://i.pravatar.cc/150?img=4',
                    isIncoming: true,
                    isMissed: true,
                    isVideo: true,
                  ),
                  _buildCallItem(
                    name: 'William Davis',
                    time: '14-11-2025',
                    imageUrl: 'https://i.pravatar.cc/150?img=4',
                    isIncoming: false,
                    isMissed: false,
                    isVideo: true,
                  ),
                  _buildCallItem(
                    name: 'Isabella Garcia',
                    time: '11-11-2025',
                    imageUrl: 'https://i.pravatar.cc/150?img=6',
                    isIncoming: true,
                    isMissed: true,
                    isVideo: false,
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

  Widget _buildFavouriteItem({
    required String name,
    required String imageUrl,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.spacing12),
      margin: const EdgeInsets.only(bottom: AppSizes.spacing8),
      borderRadius: BorderRadius.circular(AppSizes.radiusM),
      blur: 10,
      opacity: 0.15,
      child: Row(
        children: [
          AvatarWidget(
            imageUrl: imageUrl,
            name: name,
            size: 48,
          ),
          const SizedBox(width: AppSizes.spacing16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppSizes.fontSizeM,
                fontWeight: FontWeight.w500,
              ),
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
              icon: const Icon(CupertinoIcons.phone, color: Colors.white, size: 22),
              onPressed: () {},
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
              icon: const Icon(CupertinoIcons.videocam, color: Colors.white, size: 22),
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
    );
  }

  Widget _buildCallItem({
    required String name,
    required String time,
    required String imageUrl,
    required bool isIncoming,
    required bool isMissed,
    required bool isVideo,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.spacing12),
      margin: const EdgeInsets.only(bottom: AppSizes.spacing8),
      borderRadius: BorderRadius.circular(AppSizes.radiusM),
      blur: 10,
      opacity: 0.1,
      onTap: () {
        // Show call info
      },
      child: Row(
        children: [
          AvatarWidget(
            imageUrl: imageUrl,
            name: name,
            size: 48,
          ),
          const SizedBox(width: AppSizes.spacing16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isMissed ? Colors.red : Colors.white,
                    fontSize: AppSizes.fontSizeM,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppSizes.spacing4),
                Row(
                  children: [
                    Icon(
                      isVideo ? CupertinoIcons.videocam : CupertinoIcons.phone,
                      size: 14,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: AppSizes.spacing4),
                    Text(
                      isIncoming
                          ? 'Incoming'
                          : (isMissed ? 'Missed' : 'Outgoing'),
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: AppSizes.fontSizeS,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: AppSizes.fontSizeXS,
                ),
              ),
              const SizedBox(height: AppSizes.spacing4),
              Icon(
                CupertinoIcons.info,
                color: Colors.grey[500],
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
