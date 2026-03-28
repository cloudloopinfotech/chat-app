import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/services/storage_service.dart';
import '../../../app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final StorageService _storageService = Get.find();
  final currentPage = 0.obs;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Connect with Friends',
      subtitle: 'Chat with your friends and family anytime, anywhere',
      icon: Icons.people_rounded,
    ),
    OnboardingPage(
      title: 'Share Moments',
      subtitle: 'Share your special moments through status and stories',
      icon: Icons.photo_camera_rounded,
    ),
    OnboardingPage(
      title: 'Stay in Touch',
      subtitle: 'Make voice and video calls with crystal clear quality',
      icon: Icons.videocam_rounded,
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void skip() async {
    await _storageService.setHasSeenOnboarding(true);
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void getStarted() async {
    await _storageService.setHasSeenOnboarding(true);
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}

class OnboardingPage {
  final String title;
  final String subtitle;
  final IconData icon;

  OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
