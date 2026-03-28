import 'package:get/get.dart';

class StatusViewerController extends GetxController {
  // Observable properties
  final currentStatusIndex = 0.obs;
  final totalStatuses = 5.obs;
  final userName = 'Dharmeshbhai Vestige11'.obs;
  final userAvatar = 'https://i.pravatar.cc/150?img=7'.obs;
  final statusTime = 'yesterday, 5:22 PM'.obs;
  final currentStatusUrl = 'https://picsum.photos/400/800'.obs;
  final isLiked = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Get arguments if passed from previous screen
    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      userName.value = args['userName'] ?? 'User';
      userAvatar.value = args['userAvatar'] ?? '';
      statusTime.value = args['statusTime'] ?? 'Just now';
      currentStatusUrl.value =
          args['statusUrl'] ?? 'https://picsum.photos/400/800';
    }
  }

  void nextStatus() {
    if (currentStatusIndex.value < totalStatuses.value - 1) {
      currentStatusIndex.value++;
      // Load next status image
      currentStatusUrl.value =
          'https://picsum.photos/400/800?random=${currentStatusIndex.value}';
    } else {
      // Go to next user's status or close
      Get.back();
    }
  }

  void previousStatus() {
    if (currentStatusIndex.value > 0) {
      currentStatusIndex.value--;
      // Load previous status image
      currentStatusUrl.value =
          'https://picsum.photos/400/800?random=${currentStatusIndex.value}';
    } else {
      // Go back
      Get.back();
    }
  }

  void toggleLike() {
    isLiked.value = !isLiked.value;
    Get.snackbar(
      '',
      isLiked.value ? 'Liked' : 'Unliked',
      duration: const Duration(seconds: 1),
    );
  }
}
