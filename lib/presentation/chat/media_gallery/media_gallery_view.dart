import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'media_gallery_controller.dart';
import '../../../app/themes/app_colors.dart';

class MediaGalleryView extends GetView<MediaGalleryController> {
  const MediaGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Gallery'),
      ),
      body: Column(
        children: [
          // Tabs
          Obx(() => Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                  children: [
                    _buildTab('Images', MediaType.images),
                    _buildTab('Videos', MediaType.videos),
                    _buildTab('Docs', MediaType.documents),
                    _buildTab('Links', MediaType.links),
                    _buildTab('Audio', MediaType.audio),
                  ],
                ),
              )),

          // Content
          Expanded(
            child: Obx(() {
              switch (controller.selectedTab.value) {
                case MediaType.images:
                  return _buildImageGrid();
                case MediaType.videos:
                  return _buildVideoGrid();
                case MediaType.documents:
                  return _buildDocumentList();
                case MediaType.links:
                  return _buildLinkList();
                case MediaType.audio:
                  return _buildAudioList();
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, MediaType type) {
    final isSelected = controller.selectedTab.value == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(type),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primary : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageGrid() {
    return Obx(() => GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: controller.images.length,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: controller.images[index],
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: Colors.grey[300]),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
        ));
  }

  Widget _buildVideoGrid() {
    return Obx(() => GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: controller.videos.length,
          itemBuilder: (context, index) {
            return Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: controller.videos[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey[300]),
                ),
                const Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        ));
  }

  Widget _buildDocumentList() {
    return Obx(() => ListView.builder(
          itemCount: controller.documents.length,
          itemBuilder: (context, index) {
            final doc = controller.documents[index];
            return ListTile(
              leading: const Icon(Icons.description, size: 40),
              title: Text(doc['name']!),
              subtitle: Text(doc['size']!),
              trailing: IconButton(
                icon: const Icon(Icons.download),
                onPressed: () =>
                    Get.snackbar('Download', 'Downloading ${doc['name']}'),
              ),
            );
          },
        ));
  }

  Widget _buildLinkList() {
    return Obx(() => ListView.builder(
          itemCount: controller.links.length,
          itemBuilder: (context, index) {
            final link = controller.links[index];
            return ListTile(
              leading: const Icon(Icons.link, size: 40),
              title: Text(link),
              trailing: IconButton(
                icon: const Icon(Icons.open_in_new),
                onPressed: () => Get.snackbar('Open', 'Opening $link'),
              ),
            );
          },
        ));
  }

  Widget _buildAudioList() {
    return Obx(() => ListView.builder(
          itemCount: controller.audio.length,
          itemBuilder: (context, index) {
            final audio = controller.audio[index];
            return ListTile(
              leading: const Icon(Icons.audiotrack, size: 40),
              title: Text(audio['name']!),
              subtitle: Text(audio['duration']!),
              trailing: IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () =>
                    Get.snackbar('Play', 'Playing ${audio['name']}'),
              ),
            );
          },
        ));
  }
}
