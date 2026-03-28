import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../app/routes/app_routes.dart';

class SetupProfileController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final ImagePicker _imagePicker = ImagePicker();

  final nameController = TextEditingController();
  final bioController = TextEditingController();

  final isLoading = false.obs;
  final selectedAvatar = Rxn<String>();
  final selectedStatus = 'Available'.obs;
  final nameError = RxnString();

  late String userId;

  final List<String> statusOptions = [
    'Available',
    'Busy',
    'At work',
    'At school',
    'In a meeting',
    'Offline',
  ];

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    userId = args?['userId'] ?? '';
  }

  @override
  void onClose() {
    nameController.dispose();
    bioController.dispose();
    super.onClose();
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image != null) {
        // In a real app, upload to server and get URL
        // For now, use a placeholder
        selectedAvatar.value =
            'https://i.pravatar.cc/150?img=${DateTime.now().millisecondsSinceEpoch % 70}';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  bool _validateForm() {
    if (nameController.text.trim().isEmpty) {
      nameError.value = 'Name is required';
      return false;
    }

    if (nameController.text.trim().length < 2) {
      nameError.value = 'Name must be at least 2 characters';
      return false;
    }

    nameError.value = null;
    return true;
  }

  Future<void> completeSetup() async {
    if (!_validateForm()) return;

    isLoading.value = true;

    try {
      final user = await _authRepository.setupProfile(
        userId: userId,
        name: nameController.text.trim(),
        avatar: selectedAvatar.value,
        bio: bioController.text.trim().isEmpty
            ? null
            : bioController.text.trim(),
        status: selectedStatus.value,
      );

      if (user != null) {
        Get.offAllNamed(AppRoutes.HOME);
        Get.snackbar(
          'Success',
          'Welcome to CliChat, ${user.name}!',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to setup profile',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
