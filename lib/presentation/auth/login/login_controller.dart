import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();

  final isLoading = false.obs;
  final phoneError = RxnString();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  bool _validatePhone() {
    bool isValid = true;

    // Phone validation
    if (phoneController.text.isEmpty) {
      phoneError.value = 'Phone number is required';
      isValid = false;
    } else if (phoneController.text.length != 10) {
      phoneError.value = 'Please enter a valid 10-digit phone number';
      isValid = false;
    } else if (!GetUtils.isNumericOnly(phoneController.text)) {
      phoneError.value = 'Phone number must contain only digits';
      isValid = false;
    } else {
      phoneError.value = null;
    }

    return isValid;
  }

  Future<void> sendOTP() async {
    if (!_validatePhone()) return;

    isLoading.value = true;

    // Simulate network delay for sending OTP
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // Navigate to OTP screen with phone number
    Get.toNamed(
      AppRoutes.OTP,
      arguments: {
        'phoneNumber': '+91${phoneController.text}',
      },
    );

    Get.snackbar(
      'OTP Sent',
      'Verification code sent to +91${phoneController.text}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
