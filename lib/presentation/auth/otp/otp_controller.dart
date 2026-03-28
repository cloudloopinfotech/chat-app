import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_constants.dart';
import '../../../app/themes/app_colors.dart';

class OtpController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  final isLoading = false.obs;
  final resendTimer = 60.obs;
  final canResend = false.obs;
  
  // Observable to track OTP completion
  final otpComplete = false.obs;
  
  // Observable list to track each field's text
  final List<RxString> otpTexts = List.generate(6, (index) => ''.obs);
  
  // Observable list to track each field's focus state
  final List<RxBool> focusStates = List.generate(6, (index) => false.obs);

  late String phoneNumber;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    phoneNumber = args?['phoneNumber'] ?? '';
    _startResendTimer();
    _setupTextListeners();
  }
  
  void _setupTextListeners() {
    for (int i = 0; i < otpControllers.length; i++) {
      // Listen to text changes
      otpControllers[i].addListener(() {
        otpTexts[i].value = otpControllers[i].text;
        // Update completion status
        final otp = otpControllers.map((c) => c.text).join();
        otpComplete.value = otp.length == 6;
      });
      
      // Listen to focus changes
      focusNodes[i].addListener(() {
        focusStates[i].value = focusNodes[i].hasFocus;
      });
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }

  void _startResendTimer() {
    canResend.value = false;
    resendTimer.value = 60;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void onOtpChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    }

    // Update completion status
    final otp = otpControllers.map((c) => c.text).join();
    otpComplete.value = otp.length == 6;

    // Auto-verify when all fields are filled
    if (index == 5 && value.isNotEmpty) {
      if (otp.length == 6) {
        verifyOtp();
      }
    }
  }

  void onOtpBackspace(int index) {
    if (index > 0 && otpControllers[index].text.isEmpty) {
      focusNodes[index - 1].requestFocus();
    }
  }

  Future<void> verifyOtp() async {
    final otp = otpControllers.map((c) => c.text).join();

    if (otp.length != 6) {
      Get.snackbar(
        AppStrings.error,
        'Please enter complete OTP',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      // Simulate OTP verification (in real app, verify with backend)
      await Future.delayed(const Duration(seconds: 2));

      final isValid = otp == '123456'; // Mock validation

      if (isValid) {
        Get.offAllNamed(AppRoutes.HOME);
        Get.snackbar(
          AppStrings.success,
          'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          AppStrings.error,
          'Invalid OTP. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: Colors.white,
        );
        // Clear OTP fields
        for (var controller in otpControllers) {
          controller.clear();
        }
        focusNodes[0].requestFocus();
      }
    } catch (e) {
      Get.snackbar(
        AppStrings.error,
        AppStrings.somethingWentWrong,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOtp() async {
    if (!canResend.value) return;

    Get.snackbar(
      AppStrings.success,
      'OTP has been resent to $phoneNumber',
      snackPosition: SnackPosition.BOTTOM,
    );

    _startResendTimer();
  }
}
