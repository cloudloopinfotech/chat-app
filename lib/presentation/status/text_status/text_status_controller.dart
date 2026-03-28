import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStatusController extends GetxController {
  final textController = TextEditingController();
  final backgroundColor = const Color(0xFF8B4556).obs;

  final List<Color> backgroundColors = [
    const Color(0xFF8B4556),
    const Color(0xFF2E7D32),
    const Color(0xFF1976D2),
    const Color(0xFFD32F2F),
    const Color(0xFFF57C00),
    const Color(0xFF7B1FA2),
  ];

  void showColorPicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Choose Background Color',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: backgroundColors.map((color) {
                return GestureDetector(
                  onTap: () {
                    backgroundColor.value = color;
                    Get.back();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: backgroundColor.value == color
                            ? Colors.black
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void showFontPicker() {
    Get.snackbar('Font Picker', 'Font selection coming soon');
  }

  void postStatus() {
    if (textController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter some text');
      return;
    }

    Get.back();
    Get.snackbar('Success', 'Status posted successfully');
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
