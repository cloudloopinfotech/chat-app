import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'group_info_controller.dart';

class GroupInfoView extends GetView<GroupInfoController> {
  const GroupInfoView({super.key});

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
                child:
                    const Text('Edit', style: TextStyle(color: Colors.white)),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
            title: const Text('Group info',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Group Icon
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                const SizedBox(height: 16),
                // Group Name
                const Text(
                  'Tech Innovation Hub',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Member Count
                const Text(
                  'Group · 1,005 members',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 20),

                // Action Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.graphic_eq, 'Voice Chat'),
                      _buildActionButton(Icons.person_add_outlined, 'Add'),
                      _buildActionButton(Icons.search, 'Search'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                Container(
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xFF1F2C34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '🌐 *IT Internship Opportunities Hub* 🌐',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Welcome to the IT Internship...',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('See more',
                              style: TextStyle(color: Colors.green)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Media, Links, Docs
                _buildSettingsItem(
                  icon: Icons.image,
                  title: 'Media, links and docs',
                  trailing: '97 >',
                ),
                _buildSettingsItem(
                  icon: Icons.star_border,
                  title: 'Starred',
                  trailing: 'None >',
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
                        trailing: 'Muted >',
                      ),
                      const Divider(height: 1, color: Colors.black),
                      _buildSettingsTile(
                        icon: Icons.palette_outlined,
                        title: 'Chat theme',
                        trailing: '>',
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
                      _buildSettingsTile(
                        icon: Icons.timer_outlined,
                        title: 'Disappearing messages',
                        trailing: 'Off >',
                      ),
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
                            activeColor: Colors.green,
                            tileColor: const Color(0xFF1F2C34),
                          )),
                      const Divider(height: 1, color: Colors.black),
                      _buildSettingsTile(
                        icon: Icons.security,
                        title: 'Advanced chat privacy',
                        trailing: 'Off >',
                      ),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        leading: const Icon(Icons.lock_person_outlined,
                            color: Colors.grey),
                        title: const Text('Encryption',
                            style: TextStyle(color: Colors.white)),
                        subtitle: const Text(
                            'Messages and calls are end-to-end encrypted.\nTap to learn more.',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        trailing:
                            const Icon(Icons.chevron_right, color: Colors.grey),
                        tileColor: const Color(0xFF1F2C34),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Members
                Container(
                  color: const Color(0xFF1F2C34),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('37 members',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          const Icon(Icons.search, color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.members.length,
                            itemBuilder: (context, index) {
                              final member = controller.members[index];
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[800],
                                  child: Text((member['name'] as String)[0],
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      member['name'] as String,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    if (member['isAdmin'] as bool)
                                      Container(
                                        margin: const EdgeInsets.only(left: 8),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Text('Admin',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10)),
                                      ),
                                  ],
                                ),
                                subtitle: Text(
                                  (member['status'] as String).isNotEmpty
                                      ? member['status'] as String
                                      : (member['phone'] as String? ?? ''),
                                  style: const TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: (member['isAdmin'] as bool)
                                    ? const Text('Admin',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12))
                                    : null,
                              );
                            },
                          )),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See all',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Exit & Report
                Container(
                  color: const Color(0xFF1F2C34),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text('Exit group',
                            style: TextStyle(color: Colors.red)),
                        onTap: () {},
                      ),
                      const Divider(height: 1, color: Colors.black),
                      ListTile(
                        leading: const Icon(Icons.thumb_down_outlined,
                            color: Colors.red),
                        title: const Text('Report group',
                            style: TextStyle(color: Colors.red)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Created by +91 93134 23250.\nCreated 31 Dec 2023.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2C34),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.green, size: 24),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
      {required IconData icon,
      required String title,
      required String trailing}) {
    return Container(
      color: const Color(0xFF1F2C34),
      margin: const EdgeInsets.only(bottom: 1),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: Text(trailing, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget _buildSettingsTile(
      {required IconData icon,
      required String title,
      required String trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Text(trailing, style: const TextStyle(color: Colors.grey)),
    );
  }
}
