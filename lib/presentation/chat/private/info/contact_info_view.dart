import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'contact_info_controller.dart';
import '../../../../core/widgets/avatar_widget.dart';
import '../../../../app/themes/app_colors.dart';

class ContactInfoView extends GetView<ContactInfoController> {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B141A),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF1F2C34),
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Edit', style: TextStyle(color: Colors.white)),
              ),
            ],
            title: const Text('Contact info',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Profile Picture
                AvatarWidget(
                  imageUrl: controller.user.avatar,
                  name: controller.user.name,
                  size: 100,
                ),
                const SizedBox(height: 16),
                // Name
                Text(
                  controller.user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Phone Number
                Text(
                  controller.getPhoneNumber(),
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 4),
                // Username
                Text(
                  controller.user.username,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 24),

                // Action Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        Icons.call,
                        'Audio',
                        controller.makeAudioCall,
                      ),
                      _buildActionButton(
                        Icons.videocam,
                        'Video',
                        controller.makeVideoCall,
                      ),
                      _buildActionButton(
                        Icons.currency_rupee,
                        'Pay',
                        controller.makePayment,
                      ),
                      _buildActionButton(
                        Icons.search,
                        'Search',
                        controller.searchChat,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Media, Links, Docs
                Container(
                  color: const Color(0xFF1F2C34),
                  child: Column(
                    children: [
                      Obx(() => _buildSettingsItem(
                            icon: Icons.image,
                            title: 'Media, links and docs',
                            trailing: '${controller.mediaCount.value} >',
                            onTap: controller.openMedia,
                          )),
                      const Divider(height: 1, color: Colors.black),
                      Obx(() => _buildSettingsItem(
                            icon: Icons.star_border,
                            title: 'Starred',
                            trailing: controller.starredCount.value > 0
                                ? '${controller.starredCount.value} >'
                                : 'None >',
                            onTap: controller.openStarred,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Notifications & Settings
                Container(
                  color: const Color(0xFF1F2C34),
                  child: Column(
                    children: [
                      _buildSettingsTile(
                        icon: Icons.notifications_none,
                        title: 'Notifications',
                        trailing: '>',
                        onTap: controller.openNotifications,
                      ),
                      const Divider(height: 1, color: Colors.black),
                      _buildSettingsTile(
                        icon: Icons.palette_outlined,
                        title: 'Chat theme',
                        trailing: '>',
                        onTap: controller.openChatTheme,
                      ),
                      const Divider(height: 1, color: Colors.black),
                      _buildSettingsTile(
                        icon: Icons.save_alt,
                        title: 'Save to Photos',
                        trailing: 'Default >',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Security & Privacy
                Container(
                  color: const Color(0xFF1F2C34),
                  child: Column(
                    children: [
                      Obx(() => _buildSettingsTile(
                            icon: Icons.timer_outlined,
                            title: 'Disappearing messages',
                            trailing: controller.isDisappearingMessagesOn.value
                                ? 'On >'
                                : 'Off >',
                            onTap: controller.toggleDisappearingMessages,
                          )),
                      const Divider(height: 1, color: Colors.black),
                      Obx(() => SwitchListTile(
                            secondary: const Icon(Icons.lock_outline,
                                color: Colors.grey),
                            title: const Text('Lock chat',
                                style: TextStyle(color: Colors.white)),
                            subtitle: const Text(
                                'Lock and hide this chat on this device.',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            value: controller.isLocked.value,
                            onChanged: (val) => controller.toggleLock(),
                            activeColor: AppColors.primary,
                            tileColor: const Color(0xFF1F2C34),
                          )),
                      const Divider(height: 1, color: Colors.black),
                      Obx(() => _buildSettingsTile(
                            icon: Icons.security,
                            title: 'Advanced chat privacy',
                            trailing: controller.isAdvancedPrivacyOn.value
                                ? 'On >'
                                : 'Off >',
                            onTap: controller.toggleAdvancedPrivacy,
                          )),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        leading: const Icon(Icons.lock_person_outlined,
                            color: Colors.grey),
                        title: const Text('Encryption',
                            style: TextStyle(color: Colors.white)),
                        subtitle: const Text(
                            'Messages and calls are end-to-end encrypted. Tap to verify.',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        trailing:
                            const Icon(Icons.chevron_right, color: Colors.grey),
                        tileColor: const Color(0xFF1F2C34),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Contact Details
                Container(
                  color: const Color(0xFF1F2C34),
                  child: _buildSettingsTile(
                    icon: Icons.person_outline,
                    title: 'Contact details',
                    trailing: '>',
                    onTap: controller.openContactDetails,
                  ),
                ),
                const SizedBox(height: 10),

                // Groups in Common
                Container(
                  color: const Color(0xFF1F2C34),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.groupsInCommon.length} groups in common',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.add_circle_outline,
                            color: AppColors.primary),
                        title: Text(
                          'Create group with ${controller.user.name}',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                          ),
                        ),
                        onTap: controller.createGroupWithUser,
                      ),
                      const SizedBox(height: 8),
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.groupsInCommon.length,
                            itemBuilder: (context, index) {
                              final group = controller.groupsInCommon[index];
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  radius: 24,
                                  backgroundImage:
                                      NetworkImage(group['avatar'] as String),
                                ),
                                title: Text(
                                  group['name'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  (group['participants'] as List<String>)
                                      .join(', '),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: const Icon(Icons.chevron_right,
                                    color: Colors.grey),
                              );
                            },
                          )),
                      if (controller.groupsInCommon.length > 3)
                        TextButton(
                          onPressed: () {},
                          child: const Text('See all',
                              style: TextStyle(color: Colors.grey)),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Actions
                Container(
                  color: const Color(0xFF1F2C34),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Share contact',
                            style: TextStyle(color: AppColors.primary)),
                        onTap: controller.shareContact,
                      ),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        title: const Text('Add to Favourites',
                            style: TextStyle(color: AppColors.primary)),
                        onTap: controller.addToFavourites,
                      ),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        title: const Text('Add to list',
                            style: TextStyle(color: AppColors.primary)),
                        onTap: controller.addToList,
                      ),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        title: const Text('Export chat',
                            style: TextStyle(color: AppColors.primary)),
                        onTap: controller.exportChat,
                      ),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        title: const Text('Clear chat',
                            style: TextStyle(color: Colors.red)),
                        onTap: controller.clearChat,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // User Actions
                Container(
                  color: const Color(0xFF1F2C34),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Block ${controller.user.name}',
                            style: const TextStyle(color: Colors.red)),
                        onTap: controller.blockUser,
                      ),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        title: Text('Report ${controller.user.name}',
                            style: const TextStyle(color: Colors.red)),
                        onTap: controller.reportUser,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2C34),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Text(trailing, style: const TextStyle(color: Colors.grey)),
      onTap: onTap,
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Text(trailing, style: const TextStyle(color: Colors.grey)),
      onTap: onTap,
    );
  }
}

