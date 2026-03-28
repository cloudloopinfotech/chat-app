import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'chat_list_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/chat_model.dart';

class ChatListView extends GetView<ChatListController> {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with menu and action buttons
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
                  // Top row with 3 buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left side: 3-dot menu button
                      GlassContainer(
                        width: 40,
                        height: 40,
                        borderRadius: BorderRadius.circular(20),
                        blur: 15,
                        opacity: 0.2,
                        color: Colors.white,
                        child: IconButton(
                          icon: const Icon(CupertinoIcons.ellipsis_vertical,
                              color: Colors.white, size: 20),
                          onPressed: () => _showChatSelectionMenu(context),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                          ),
                        ),
                      ),
                      // Right side: Camera and Add buttons
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Camera button (circular background)
                          GlassContainer(
                            width: 40,
                            height: 40,
                            borderRadius: BorderRadius.circular(20),
                            blur: 15,
                            opacity: 0.2,
                            color: Colors.white,
                            child: IconButton(
                              icon: const Icon(CupertinoIcons.camera,
                                  color: Colors.white, size: 22),
                              onPressed: () => controller.openCameraForStatus(),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSizes.spacing8),
                          // Add button (green circle with glass effect)
                          GlassContainer(
                            width: 40,
                            height: 40,
                            borderRadius: BorderRadius.circular(20),
                            blur: 10,
                            opacity: 0.4,
                            color: AppColors.primary,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () => _showNewChatBottomSheet(context),
                                child: const Center(
                                  child: Icon(
                                    CupertinoIcons.add,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Chats text below buttons
                  const Padding(
                    padding: EdgeInsets.only(
                      top: AppSizes.spacing8,
                      left: 0,
                    ),
                    child: Text(
                      AppStrings.chats,
                      style: TextStyle(
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
                    hintText: AppStrings.askMetaAI,
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
                  onChanged: (value) {
                    controller.searchChats(value);
                  },
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spacing12),

            // Filter Tabs
            Obx(() => SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spacing16),
                    children: [
                      _buildFilterTab(
                        label: AppStrings.all,
                        isSelected: controller.selectedFilter.value == 'all',
                        onTap: () => controller.setFilter('all'),
                      ),
                      const SizedBox(width: AppSizes.spacing12),
                      _buildFilterTab(
                        label: AppStrings.unread,
                        count: controller.getUnreadCount(),
                        isSelected: controller.selectedFilter.value == 'unread',
                        onTap: () => controller.setFilter('unread'),
                      ),
                      const SizedBox(width: AppSizes.spacing12),
                      _buildFilterTab(
                        label: AppStrings.favourites,
                        isSelected:
                            controller.selectedFilter.value == 'favourites',
                        onTap: () => controller.setFilter('favourites'),
                      ),
                      const SizedBox(width: AppSizes.spacing12),
                      _buildFilterTab(
                        label: AppStrings.groups,
                        count: controller.getGroupsCount(),
                        isSelected: controller.selectedFilter.value == 'groups',
                        onTap: () => controller.setFilter('groups'),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: AppSizes.spacing8),

            // Chat List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.chats.isEmpty) {
                  return Center(
                    child: Text(
                      AppStrings.noChatsYet,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.chats.length,
                  itemBuilder: (context, index) {
                    final chat = controller.chats[index];
                    return _buildChatTile(context, chat);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab({
    required String label,
    int? count,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spacing16,
          vertical: AppSizes.spacing10,
        ),
        borderRadius: BorderRadius.circular(20),
        blur: isSelected ? 15 : 10,
        opacity: isSelected ? 0.4 : 0.15,
        color: isSelected ? AppColors.primary : Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey[400],
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            if (count != null && count > 0) ...[
              const SizedBox(width: AppSizes.spacing6),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.black.withOpacity(0.2)
                      : Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildChatTile(BuildContext context, ChatModel chat) {
    final name = controller.getChatName(chat);
    final avatar = controller.getChatAvatar(chat);
    final isOnline = controller.isUserOnline(chat);

    return InkWell(
      onTap: () => controller.openChat(chat),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM,
          vertical: AppSizes.spacing10,
        ),
        child: Row(
          children: [
            // Avatar
            AvatarWidget(
              imageUrl: avatar,
              name: name,
              size: AppSizes.avatarSizeL,
              showOnlineIndicator: chat.type == ChatType.private,
              isOnline: isOnline,
            ),
            const SizedBox(width: AppSizes.spacing12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Pin
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AppSizes.fontSizeL,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (chat.isPinned)
                        const Padding(
                          padding: EdgeInsets.only(left: AppSizes.spacing4),
                          child: Icon(
                            CupertinoIcons.pin,
                            size: AppSizes.iconSizeXS,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spacing2),
                  // Message
                  Row(
                    children: [
                      if (chat.lastMessage?.senderId ==
                          controller.currentUser.value?.id)
                        const Padding(
                          padding: EdgeInsets.only(right: AppSizes.spacing4),
                          child: Icon(
                            CupertinoIcons.check_mark,
                            size: AppSizes.iconSizeXS,
                            color: Colors.blue,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          chat.lastMessage?.content ?? AppStrings.noMessagesYet,
                          style: TextStyle(
                            color: chat.unreadCount > 0
                                ? Colors.grey[300]
                                : Colors.grey[500],
                            fontSize: AppSizes.fontSizeS,
                            fontWeight: chat.unreadCount > 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSizes.spacing8),
            // Trailing: Time, Unread, Mute
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _formatTime(chat.timestamp),
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeS,
                    color: chat.unreadCount > 0
                        ? AppColors.primary
                        : Colors.grey[500],
                    fontWeight: chat.unreadCount > 0
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                if (chat.unreadCount > 0) ...[
                  const SizedBox(height: AppSizes.spacing4),
                  Container(
                    padding: chat.unreadCount > 99
                        ? const EdgeInsets.symmetric(
                            horizontal: AppSizes.spacing6,
                            vertical: AppSizes.spacing2,
                          )
                        : const EdgeInsets.all(AppSizes.spacing4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: chat.unreadCount > 99
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      borderRadius: chat.unreadCount > 99
                          ? BorderRadius.circular(AppSizes.radiusS)
                          : null,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: AppSizes.badgeSizeM,
                      minHeight: AppSizes.badgeSizeM,
                    ),
                    child: Center(
                      child: Text(
                        chat.unreadCount > 99 ? '999+' : '${chat.unreadCount}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: AppSizes.fontSizeXS,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
                if (chat.isMuted)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSizes.spacing4),
                    child: Icon(
                      CupertinoIcons.bell_slash,
                      size: AppSizes.iconSizeXS,
                      color: Colors.grey[500],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return DateFormat('h:mm a').format(dateTime).toLowerCase();
    } else if (difference.inDays == 1) {
      return AppStrings.yesterday;
    } else if (difference.inDays < 7) {
      return DateFormat('EEEE').format(dateTime);
    } else {
      return DateFormat('dd/MM/yy').format(dateTime);
    }
  }

  void _showNewChatBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spacing16,
                      vertical: AppSizes.spacing12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppSizes.fontSizeXXXL,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.xmark,
                              color: Colors.white),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  ),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spacing16),
                    child: GlassContainer(
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      blur: 15,
                      opacity: 0.2,
                      color: Colors.white,
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.white, fontSize: AppSizes.fontSizeM),
                        decoration: InputDecoration(
                          hintText: 'Search name or number',
                          hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontSize: AppSizes.fontSizeM),
                          prefixIcon: Icon(CupertinoIcons.search,
                              color: Colors.grey[500],
                              size: AppSizes.iconSizeM),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingM,
                            vertical: AppSizes.spacing12,
                          ),
                        ),
                        onChanged: (value) {
                          controller.searchContacts(value);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spacing8),

                  // Options List
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSizes.spacing8),
                      children: [
                        // New group
                        _buildNewChatOption(
                          icon: CupertinoIcons.group,
                          title: 'New group',
                          onTap: () {
                            Get.back();
                            Get.snackbar(AppStrings.groups,
                                AppStrings.featureComingSoon);
                          },
                        ),

                        // New contact
                        _buildNewChatOption(
                          icon: CupertinoIcons.person_add,
                          title: 'New contact',
                          onTap: () {
                            Get.back();
                            Get.snackbar(AppStrings.contacts,
                                AppStrings.featureComingSoon);
                          },
                        ),

                        // New community
                        _buildNewChatOption(
                          icon: CupertinoIcons.person_3,
                          title: 'New community',
                          subtitle: 'Bring together topic-based groups',
                          onTap: () {
                            Get.back();
                            Get.snackbar(
                                'Community', AppStrings.featureComingSoon);
                          },
                        ),

                        // Chat with AIs
                        _buildNewChatOption(
                          icon: CupertinoIcons.chat_bubble_2_fill,
                          title: 'Chat with AIs',
                          onTap: () {
                            Get.back();
                            Get.snackbar(
                                'AI Chat', AppStrings.featureComingSoon);
                          },
                        ),

                        // New broadcast
                        _buildNewChatOption(
                          icon: CupertinoIcons.antenna_radiowaves_left_right,
                          title: 'New broadcast',
                          onTap: () {
                            Get.back();
                            Get.snackbar(
                                'Broadcast', AppStrings.featureComingSoon);
                          },
                        ),

                        const SizedBox(height: AppSizes.spacing16),

                        // Frequently contacted section
                        Obx(() {
                          final frequentContacts =
                              controller.getFrequentlyContacted();
                          if (frequentContacts.isEmpty)
                            return const SizedBox.shrink();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.spacing16,
                                  vertical: AppSizes.spacing8,
                                ),
                                child: Text(
                                  'Frequently contacted',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: AppSizes.fontSizeS,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ...frequentContacts
                                  .map((user) => _buildContactItem(user)),
                            ],
                          );
                        }),

                        const SizedBox(height: AppSizes.spacing16),

                        // Contacts on CliChat section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.spacing16,
                            vertical: AppSizes.spacing8,
                          ),
                          child: Text(
                            'Contacts on CliChat',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: AppSizes.fontSizeS,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        // Message yourself option
                        Obx(() {
                          final currentUser = controller.getCurrentUser();
                          if (currentUser == null)
                            return const SizedBox.shrink();

                          return _buildContactItem(
                            currentUser,
                            subtitle: 'Message yourself',
                          );
                        }),

                        // All contacts list
                        Obx(() {
                          final contacts = controller.getAllContacts();
                          if (contacts.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(AppSizes.spacing32),
                              child: Center(
                                child: Text(
                                  'No contacts found',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: AppSizes.fontSizeM,
                                  ),
                                ),
                              ),
                            );
                          }

                          String currentLetter = '';
                          return Column(
                            children: contacts.map((user) {
                              final firstLetter = user.name.isNotEmpty
                                  ? user.name[0].toUpperCase()
                                  : '#';
                              final showLetter = firstLetter != currentLetter;
                              if (showLetter) currentLetter = firstLetter;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (showLetter)
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        AppSizes.spacing16,
                                        AppSizes.spacing8,
                                        AppSizes.spacing16,
                                        AppSizes.spacing4,
                                      ),
                                      child: Text(
                                        firstLetter,
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: AppSizes.fontSizeS,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  _buildContactItem(user),
                                ],
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewChatOption({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spacing16,
          vertical: AppSizes.spacing12,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.spacing12),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2C34),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
              ),
              child: Icon(icon, color: Colors.white, size: AppSizes.iconSizeM),
            ),
            const SizedBox(width: AppSizes.spacing16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.fontSizeL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSizes.spacing2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: AppSizes.fontSizeS,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(dynamic user, {String? subtitle}) {
    return InkWell(
      onTap: () {
        Get.back();
        controller.openChatWithUser(user);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spacing16,
          vertical: AppSizes.spacing8,
        ),
        child: Row(
          children: [
            AvatarWidget(
              imageUrl: user.avatar ?? '',
              size: AppSizes.avatarSizeM,
              name: user.name,
            ),
            const SizedBox(width: AppSizes.spacing12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.fontSizeM,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null || user.status != null) ...[
                    const SizedBox(height: AppSizes.spacing2),
                    Text(
                      subtitle ?? user.status ?? '',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: AppSizes.fontSizeS,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChatSelectionMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: AppSizes.spacing20),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppSizes.spacing20),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Options
                  _buildMenuOption(
                    context: context,
                    icon: CupertinoIcons.person,
                    title: AppStrings.profile,
                    onTap: () {
                      Get.back();
                      controller.goToProfile();
                    },
                  ),
                  _buildMenuOption(
                    context: context,
                    icon: CupertinoIcons.archivebox,
                    title: AppStrings.archived,
                    onTap: () {
                      Get.back();
                      controller.goToArchive();
                    },
                  ),
                  _buildMenuOption(
                    context: context,
                    icon: CupertinoIcons.star,
                    title: AppStrings.starred,
                    onTap: () {
                      Get.back();
                      Get.snackbar(
                          AppStrings.starred, AppStrings.featureComingSoon);
                    },
                  ),
                  _buildMenuOption(
                    context: context,
                    icon: CupertinoIcons.settings,
                    title: AppStrings.settings,
                    onTap: () {
                      Get.back();
                      controller.goToSettings();
                    },
                  ),
                  _buildMenuOption(
                    context: context,
                    icon: CupertinoIcons.power,
                    title: AppStrings.logout,
                    isDestructive: true,
                    onTap: () {
                      Get.back();
                      controller.logout();
                    },
                  ),
                  const SizedBox(height: AppSizes.spacing20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM,
          vertical: AppSizes.spacing16,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDestructive ? Colors.red : Colors.white,
              size: AppSizes.iconSizeM,
            ),
            const SizedBox(width: AppSizes.spacing16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isDestructive ? Colors.red : Colors.white,
                  fontSize: AppSizes.fontSizeL,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
