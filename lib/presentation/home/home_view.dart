import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../status/feed/statusfeed_view.dart';
import '../calls/calls_list/callslist_view.dart';
import 'chat_list/chat_list_view.dart';
import '../profile/settings/settings_view.dart';
import '../../../core/constants/app_constants.dart';
import '../../../app/themes/app_colors.dart';
import 'chat_list/chat_list_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatListController = Get.find<ChatListController>();
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              StatusFeedView(),
              CallsListView(),
              ChatListView(),
              SettingsView(),
            ],
          )),
      bottomNavigationBar: Obx(() {
        final unreadCount = chatListController.chats
            .where((chat) => chat.unreadCount > 0)
            .length;
        
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 0.5,
                  ),
                ),
              ),
              child: SafeArea(
                child: Container(
                  height: AppSizes.bottomNavBarHeight,
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.spacing4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  _buildNavItem(
                    icon: CupertinoIcons.news,
                    label: AppStrings.status,
                    isSelected: controller.currentIndex.value == 0,
                    onTap: () => controller.changePage(0),
                  ),
                  _buildNavItem(
                    icon: CupertinoIcons.phone,
                    label: AppStrings.calls,
                    isSelected: controller.currentIndex.value == 1,
                    onTap: () => controller.changePage(1),
                  ),
                  _buildNavItem(
                    icon: CupertinoIcons.chat_bubble,
                    label: AppStrings.chats,
                    isSelected: controller.currentIndex.value == 2,
                    badge: unreadCount > 0 ? unreadCount : null,
                    onTap: () => controller.changePage(2),
                  ),
                  _buildNavItem(
                    icon: CupertinoIcons.settings,
                    label: AppStrings.settings,
                    isSelected: controller.currentIndex.value == 3,
                    onTap: () => controller.changePage(3),
              ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    int? badge,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spacing8,
          vertical: AppSizes.spacing4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  color: isSelected ? AppColors.primary : Colors.grey[500],
                  size: AppSizes.bottomNavBarIconSize,
                ),
                if (badge != null && badge > 0)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.all(AppSizes.spacing2),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: AppSizes.badgeSizeS,
                        minHeight: AppSizes.badgeSizeS,
              ),
                      child: Center(
                        child: Text(
                          badge > 99 ? '99+' : '$badge',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSizes.spacing2),
            Container(
              height: 2,
              width: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            const SizedBox(height: AppSizes.spacing2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primary : Colors.grey[500],
                fontSize: AppSizes.fontSizeXS,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              ),
            ],
        ),
      ),
    );
  }
}
