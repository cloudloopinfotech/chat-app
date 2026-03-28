import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../settings_controller.dart';

class ListsSettingsView extends GetView<SettingsController> {
  const ListsSettingsView({super.key});

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
          'Lists',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.snackbar('Reorder', 'Reordering lists...'),
            child: const Text(
              'Reorder',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'Your lists',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildListItem(
                  title: 'New list',
                  titleColor: Colors.green,
                  onTap: () => Get.snackbar('New List', 'Creating new list...'),
                ),
                const Divider(height: 1, color: Colors.grey),
                _buildListItem(
                  title: 'Unread (preset)',
                  onTap: () {},
                ),
                const Divider(height: 1, color: Colors.grey),
                _buildListItem(
                  title: 'Favourites',
                  count: '1',
                  onTap: () {},
                ),
                const Divider(height: 1, color: Colors.grey),
                _buildListItem(
                  title: 'Groups (preset)',
                  onTap: () {},
                ),
                const Divider(height: 1, color: Colors.grey),
                _buildListItem(
                  title: 'Company for interview',
                  count: '5',
                  onTap: () {},
                ),
                const Divider(height: 1, color: Colors.grey),
                _buildListItem(
                  title: 'Job',
                  count: '29',
                  onTap: () {},
                ),
                const Divider(height: 1, color: Colors.grey),
                _buildListItem(
                  title: 'Business',
                  count: '1',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'You can edit your lists and reorder how they appear in the Chats tab.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              'Available presets',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 12,
                child: Icon(Icons.add, size: 16, color: Colors.black),
              ),
              title: const Text(
                'Communities (preset)',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Get.snackbar('Preset', 'Adding preset...'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem({
    required String title,
    Color? titleColor,
    String? count,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.white,
          fontSize: 16,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count != null) ...[
            Text(
              count,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 10),
          ],
          if (titleColor == null) // Don't show chevron for "New list"
            Icon(Icons.chevron_right, color: Colors.grey[600], size: 24),
        ],
      ),
      onTap: onTap,
    );
  }
}
