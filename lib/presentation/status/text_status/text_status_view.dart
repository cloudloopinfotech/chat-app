import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'text_status_controller.dart';

class TextStatusView extends GetView<TextStatusController> {
  const TextStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: controller.backgroundColor.value,
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Get.back(),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.text_fields,
                                color: Colors.white),
                            onPressed: () {
                              controller.showFontPicker();
                            },
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.palette, color: Colors.white),
                            onPressed: () {
                              controller.showColorPicker();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Text Input Area
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: TextField(
                        controller: controller.textController,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Type a status',
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: 32,
                          ),
                          border: InputBorder.none,
                        ),
                        autofocus: true,
                      ),
                    ),
                  ),
                ),

                // Bottom Tab Bar
                Container(
                  color: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabButton('VIDEO', false),
                      _buildTabButton('PHOTO', false),
                      _buildTabButton('TEXT', true),
                      _buildTabButton('VOICE', false),
                    ],
                  ),
                ),

                // Keyboard Suggestions
                Container(
                  color: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSuggestion('I'),
                      _buildSuggestion('The'),
                      _buildSuggestion('I\'m'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.postStatus();
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.send, color: Colors.black),
          ),
        ));
  }

  Widget _buildTabButton(String label, bool isActive) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.amber : Colors.white,
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildSuggestion(String text) {
    return TextButton(
      onPressed: () {
        controller.textController.text += text;
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
