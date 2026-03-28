import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'groupchat_controller.dart';

import '../../../data/models/message_model.dart';
import '../../../data/providers/mock_data_provider.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/constants/app_constants.dart';
import '../../../app/themes/app_colors.dart';

class GroupChatView extends GetView<GroupChatController> {
  const GroupChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B141A), // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () => Get.back(),
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(CupertinoIcons.back, color: Colors.white, size: 20),
              const SizedBox(width: 4),
              GlassContainer(
                width: 36,
                height: 36,
                borderRadius: BorderRadius.circular(18),
                blur: 10,
                opacity: 0.2,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Obx(() => Image.network(
                    controller.chat.value?.avatar ?? 'https://via.placeholder.com/150',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      CupertinoIcons.group,
                      color: Colors.white,
                      size: 20,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: controller.openGroupInfo,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Text(
                controller.chat.value?.name ?? 'Tech Innovation Hub',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              )),
              Obx(() => Text(
                controller.getParticipantNames(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
        ),
        actions: [
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
          const SizedBox(width: AppSizes.spacing8),
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
              icon: const Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white, size: 20),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png'), // WhatsApp Dark Pattern
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final reversedIndex =
                        controller.messages.length - 1 - index;
                    final message = controller.messages[reversedIndex];
                    final isMe =
                        message.senderId == MockDataProvider.currentUserId;

                    return _buildMessageBubble(message, isMe);
                  },
                );
              }),
            ),

            // Input Area
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing8, vertical: AppSizes.spacing8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GlassContainer(
                    width: 40,
                    height: 40,
                    borderRadius: BorderRadius.circular(20),
                    blur: 15,
                    opacity: 0.2,
                    color: Colors.white,
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.add, color: Colors.white, size: 24),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacing8),
                  Expanded(
                    child: GlassContainer(
                      borderRadius: BorderRadius.circular(24),
                      blur: 15,
                      opacity: 0.2,
                      color: Colors.white,
                      child: TextField(
                        controller: controller.messageController,
                        style: const TextStyle(color: Colors.white, fontSize: AppSizes.fontSizeM),
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.spacing16,
                            vertical: AppSizes.spacing10,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(CupertinoIcons.smiley, color: Colors.grey[500], size: 22),
                            onPressed: () {},
                          ),
                        ),
                        maxLines: 6,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.spacing8),
                  Obx(() => controller.messageText.value.isEmpty
                      ? GlassContainer(
                          width: 40,
                          height: 40,
                          borderRadius: BorderRadius.circular(20),
                          blur: 15,
                          opacity: 0.2,
                          color: Colors.white,
                          child: IconButton(
                            icon: const Icon(CupertinoIcons.camera, color: Colors.white, size: 24),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                          ),
                        )
                      : GlassContainer(
                          width: 40,
                          height: 40,
                          borderRadius: BorderRadius.circular(20),
                          blur: 15,
                          opacity: 0.3,
                          color: AppColors.primary,
                          child: IconButton(
                            icon: const Icon(CupertinoIcons.arrow_up, color: Colors.black, size: 22),
                            onPressed: controller.sendMessage,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                          ),
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel message, bool isMe) {
    final senderName = controller.getMemberName(message.senderId);
    final senderColor = controller.getMemberColor(message.senderId);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[800],
              child: Text(senderName[0],
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: Get.width * 0.75),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isMe ? const Color(0xFF005C4B) : const Color(0xFF1F2C34),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: Radius.circular(isMe ? 12 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        senderName,
                        style: TextStyle(
                          color: senderColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  Text(
                    message.content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Text(
                          DateFormat('h:mm a').format(message.timestamp),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
