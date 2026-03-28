import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'videocall_controller.dart';

class VideoCallView extends GetView<VideoCallController> {
  const VideoCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Remote Video (Full Screen)
          Container(
            color: Colors.grey[800],
            child: const Center(
              child: Icon(
                Icons.person,
                size: 120,
                color: Colors.white24,
              ),
            ),
          ),

          // Local Video (Small Overlay)
          Positioned(
            right: 16,
            top: 60,
            child: Obx(() => Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: controller.isVideoOff.value
                      ? const Center(
                          child:
                              Icon(Icons.videocam_off, color: Colors.white54))
                      : const Center(
                          child: Icon(Icons.person, color: Colors.white54)),
                )),
          ),

          // Controls Overlay
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Obx(() => Text(
                      controller.userName.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Switch Camera
                    _buildControlButton(
                      icon: Icons.switch_camera,
                      onTap: controller.switchCamera,
                    ),

                    // Video Toggle
                    Obx(() => _buildControlButton(
                          icon: controller.isVideoOff.value
                              ? Icons.videocam_off
                              : Icons.videocam,
                          isActive: !controller.isVideoOff.value,
                          onTap: controller.toggleVideo,
                        )),

                    // Mute Toggle
                    Obx(() => _buildControlButton(
                          icon: controller.isMuted.value
                              ? Icons.mic_off
                              : Icons.mic,
                          isActive: !controller.isMuted.value,
                          onTap: controller.toggleMute,
                        )),

                    // End Call
                    _buildControlButton(
                      icon: Icons.call_end,
                      color: Colors.red,
                      onTap: controller.endCall,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Back Button
          Positioned(
            left: 16,
            top: 60,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isActive = true,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? (isActive ? Colors.white24 : Colors.white),
        ),
        child: Icon(
          icon,
          color: color != null
              ? Colors.white
              : (isActive ? Colors.white : Colors.black),
          size: 28,
        ),
      ),
    );
  }
}
