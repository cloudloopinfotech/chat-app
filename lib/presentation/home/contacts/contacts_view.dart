import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'contacts_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select contact'),
            Text(
              '5 contacts',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildMenuItem(
            icon: Icons.group_add,
            label: 'New group',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.person_add,
            label: 'New contact',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.groups,
            label: 'New community',
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Contacts on CliChat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          _buildContactItem(
            name: 'Jane Smith',
            status: 'Busy',
            imageUrl: 'https://i.pravatar.cc/150?img=2',
          ),
          _buildContactItem(
            name: 'Mike Wilson',
            status: 'Available',
            imageUrl: 'https://i.pravatar.cc/150?img=3',
          ),
          _buildContactItem(
            name: 'Sarah Jones',
            status: 'At the gym',
            imageUrl: 'https://i.pravatar.cc/150?img=4',
          ),
          _buildContactItem(
            name: 'Alex Brown',
            status: 'Sleeping',
            imageUrl: 'https://i.pravatar.cc/150?img=5',
          ),
          _buildContactItem(
            name: 'John Doe',
            status: 'Hey there! I am using CliChat',
            imageUrl: 'https://i.pravatar.cc/150?img=1',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary,
        radius: 20,
        child: Icon(icon, color: Colors.white, size: 20),
      ),
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  Widget _buildContactItem({
    required String name,
    required String status,
    required String imageUrl,
  }) {
    return ListTile(
      leading: AvatarWidget(
        imageUrl: imageUrl,
        name: name,
        size: 40,
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        status,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
    );
  }
}
