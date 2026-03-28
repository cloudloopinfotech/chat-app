import 'package:get/get.dart';

import 'dart:async';

class AudioCallController extends GetxController {
  final isMuted = false.obs;
  final isSpeakerOn = false.obs;
  final duration = 0.obs;
  Timer? _timer;

  // Mock user data
  final userId = ''.obs;
  final userName = 'Unknown User'.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Map) {
      userId.value = Get.arguments['userId'] ?? '';
      userName.value = 'User ${userId.value}'; // Mock name resolution
    }
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration.value++;
    });
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
  }

  void toggleSpeaker() {
    isSpeakerOn.value = !isSpeakerOn.value;
  }

  void endCall() {
    _timer?.cancel();
    Get.back();
  }

  String get formattedDuration {
    final minutes = (duration.value / 60).floor().toString().padLeft(2, '0');
    final seconds = (duration.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
