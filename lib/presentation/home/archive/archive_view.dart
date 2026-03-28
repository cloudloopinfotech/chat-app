import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'archive_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';

class ArchiveView extends GetView<ArchiveController> {
  const ArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archived Chats'),
      ),
      body: ListView(
        children: [
          _buildArchivedChat(
            name: 'Old Project Group',
            message: 'Project completed successfully!',
            time: '25/11/24',
            imageUrl:
                'https://ui-avatars.com/api/?name=Old+Project&background=random',
          ),
          _buildArchivedChat(
            name: 'Spam Contact',
            message: 'Hello, I have an offer for you...',
            time: '20/11/24',
            imageUrl:
                'https://ui-avatars.com/api/?name=Spam+Contact&background=random',
          ),
        ],
      ),
    );
  }

  Widget _buildArchivedChat({
    required String name,
    required String message,
    required String time,
    required String imageUrl,
  }) {
    return ListTile(
      leading: AvatarWidget(
        imageUrl: imageUrl,
        name: name,
        size: 56,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          const Icon(Icons.archive, size: 16, color: Colors.grey),
        ],
      ),
      onTap: () {},
    );
  }
}
