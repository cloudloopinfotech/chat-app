import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'audiocall_controller.dart';

class AudioCallView extends GetView<AudioCallController> {
  const AudioCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Header
            Text(
              'Audio Call',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Obx(() => Text(
                  controller.formattedDuration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),

            const Spacer(),

            // User Info
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800],
                border: Border.all(color: Colors.white24, width: 2),
              ),
              child: const Icon(
                Icons.person,
                size: 80,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 24),
            Obx(() => Text(
                  controller.userName.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 8),
            const Text(
              'Connected',
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 16,
              ),
            ),

            const Spacer(),

            // Controls
            Container(
              padding: const EdgeInsets.only(bottom: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mute Button
                  Obx(() => _buildControlButton(
                        icon: controller.isMuted.value
                            ? Icons.mic_off
                            : Icons.mic,
                        label: 'Mute',
                        isActive: controller.isMuted.value,
                        onTap: controller.toggleMute,
                      )),

                  // End Call Button
                  _buildControlButton(
                    icon: Icons.call_end,
                    label: 'End',
                    color: Colors.red,
                    onTap: controller.endCall,
                  ),

                  // Speaker Button
                  Obx(() => _buildControlButton(
                        icon: controller.isSpeakerOn.value
                            ? Icons.volume_up
                            : Icons.volume_off,
                        label: 'Speaker',
                        isActive: controller.isSpeakerOn.value,
                        onTap: controller.toggleSpeaker,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? (isActive ? Colors.white : Colors.white24),
            ),
            child: Icon(
              icon,
              color: color != null
                  ? Colors.white
                  : (isActive ? Colors.black : Colors.white),
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
