import 'package:get/get.dart';

import 'dart:async';

class VideoCallController extends GetxController {
  final isMuted = false.obs;
  final isVideoOff = false.obs;
  final isFrontCamera = true.obs;
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

  void toggleVideo() {
    isVideoOff.value = !isVideoOff.value;
  }

  void switchCamera() {
    isFrontCamera.value = !isFrontCamera.value;
  }

  void endCall() {
    _timer?.cancel();
    Get.back();
  }
}
