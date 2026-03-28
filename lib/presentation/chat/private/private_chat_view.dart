import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'private_chat_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/message_model.dart';
import '../../../data/providers/mock_data_provider.dart';

class PrivateChatView extends GetView<PrivateChatController> {
  const PrivateChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B141A), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2C34), // Darker app bar
        leadingWidth: AppSizes.appBarLeadingWidth,
        leading: Row(
            children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
            GestureDetector(
              onTap: () => controller.openContactInfo(),
              child: AvatarWidget(
                imageUrl: controller.otherUser.avatar,
                name: controller.otherUser.name,
                size: AppSizes.avatarSizeM,
              ),
              ),
            ],
        ),
        title: GestureDetector(
          onTap: () => controller.openContactInfo(),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.otherUser.name,
              style: const TextStyle(
                    fontSize: AppSizes.fontSizeL,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.white),
            onPressed: () =>
                Get.snackbar('Call', 'Video call feature coming soon'),
          ),
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.white),
            onPressed: () =>
                Get.snackbar('Call', 'Audio call feature coming soon'),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png'), // WhatsApp Dark Pattern
            fit: BoxFit.cover,
            opacity: 0.1, // Make it subtle
          ),
        ),
        child: Column(
          children: [
            // Messages List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.messages.isEmpty) {
                  return Center(
                    child: Text('${AppStrings.noMessagesYet}\n${AppStrings.sayHi}',
                        style: const TextStyle(color: Colors.grey)),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(AppSizes.paddingM),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final reversedIndex =
                        controller.messages.length - 1 - index;
                    final message = controller.messages[reversedIndex];
                    final isMe =
                        message.senderId == MockDataProvider.currentUserId;

                    // Date Header Logic (Simplified)
                    bool showDateHeader = false;
                    if (reversedIndex == 0) {
                      showDateHeader = true;
                    } else {
                      final prevMessage =
                          controller.messages[reversedIndex - 1];
                      if (message.timestamp.day != prevMessage.timestamp.day) {
                        showDateHeader = true;
                      }
                    }

                    return Column(
                      children: [
                        if (showDateHeader) _buildDateHeader(message.timestamp),
                        _buildMessageBubble(message, isMe),
                      ],
                    );
                  },
                );
              }),
            ),

            // Typing Indicator
            Obx(() => controller.isTyping.value
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.paddingM, vertical: AppSizes.spacing8),
                    child: Row(
                      children: [
                        Text(
                          '${controller.otherUser.name} is typing...',
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeS,
                            color: AppColors.primary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()),

            // Input Area
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing8, vertical: AppSizes.spacing8),
              color: const Color(0xFF0B141A), // Match background
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.grey, size: AppSizes.iconSizeL),
                    onPressed: controller.showAttachmentMenu,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2C34),
                        borderRadius: BorderRadius.circular(AppSizes.radiusXXL),
                      ),
                      child: TextField(
                        controller: controller.messageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingM,
                            vertical: AppSizes.spacing10,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.sticky_note_2_outlined,
                                color: Colors.grey),
                            onPressed: () =>
                                Get.snackbar('Stickers', 'Feature coming soon'),
                          ),
                        ),
                        maxLines: 6,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacing4),
                  if (controller.messageController.text.isEmpty)
                    IconButton(
                      icon: const Icon(Icons.camera_alt,
                          color: Colors.grey, size: AppSizes.iconSizeL),
                      onPressed: () =>
                          Get.snackbar('Camera', 'Feature coming soon'),
                    ),
                  const SizedBox(width: AppSizes.spacing4),
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.grey, size: AppSizes.iconSizeL),
                    onPressed:
                        controller.sendMessage, // Using send for now as mic
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateHeader(DateTime timestamp) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.spacing16),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing12, vertical: AppSizes.spacing6),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2C34),
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
      ),
      child: Text(
        DateFormat('EEEE').format(timestamp), // Show Day Name
        style: const TextStyle(
            color: Colors.grey, fontSize: AppSizes.fontSizeS, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel message, bool isMe) {
    return GestureDetector(
      onLongPress: () => controller.showMessageOptions(message),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.spacing8),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(maxWidth: Get.width * 0.75),
                padding: const EdgeInsets.all(AppSizes.spacing4),
                decoration: BoxDecoration(
                  color: isMe
                      ? const Color(0xFF005C4B)
                      : const Color(
                          0xFF1F2C34), // Dark Green for me, Dark Grey for other
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(AppSizes.radiusM),
                    topRight: const Radius.circular(AppSizes.radiusM),
                    bottomLeft: Radius.circular(isMe ? AppSizes.radiusM : 0),
                    bottomRight: Radius.circular(isMe ? 0 : AppSizes.radiusM),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (message.isForwarded)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: AppSizes.spacing8, top: AppSizes.spacing4, bottom: AppSizes.spacing4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.forward,
                                size: AppSizes.iconSizeXS, color: Colors.grey),
                            const SizedBox(width: AppSizes.spacing4),
                            const Text(
                              'Forwarded',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: AppSizes.fontSizeS,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),

                    // Link Preview (if metadata exists)
                    if (message.metadata != null)
                      Container(
                        margin: const EdgeInsets.all(AppSizes.spacing4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppSizes.radiusS),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (message.metadata!['image'] != null)
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8)),
                                child: Image.network(
                                  message.metadata!['image'],
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox.shrink(),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (message.metadata!['title'] != null)
                                    Text(
                                      message.metadata!['title'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  if (message.metadata!['description'] != null)
                                    Text(
                                      message.metadata!['description'],
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        message.content,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 4, bottom: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Spacer(), // Push time to right
                          Text(
                            DateFormat('h:mm a').format(message.timestamp),
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[400],
                            ),
                          ),
                          if (isMe) ...[
                            const SizedBox(width: 4),
                            Icon(
                              message.status == MessageStatus.read
                                  ? Icons.done_all
                                  : Icons.done,
                              size: 16,
                              color: message.status == MessageStatus.read
                                  ? Colors.blue // Blue ticks
                                  : Colors.grey,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
