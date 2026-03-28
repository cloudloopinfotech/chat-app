import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class SignupController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  final usernameError = RxnString();
  final emailError = RxnString();
  final passwordError = RxnString();
  final confirmPasswordError = RxnString();

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  bool _validateForm() {
    bool isValid = true;

    // Username validation
    if (usernameController.text.isEmpty) {
      usernameError.value = 'Username is required';
      isValid = false;
    } else if (usernameController.text.length < 3) {
      usernameError.value = 'Username must be at least 3 characters';
      isValid = false;
    } else {
      usernameError.value = null;
    }

    // Email validation
    if (emailController.text.isEmpty) {
      emailError.value = 'Email is required';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = 'Please enter a valid email';
      isValid = false;
    } else {
      emailError.value = null;
    }

    // Password validation
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Password is required';
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    } else {
      passwordError.value = null;
    }

    // Confirm password validation
    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
      isValid = false;
    } else if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError.value = 'Passwords do not match';
      isValid = false;
    } else {
      confirmPasswordError.value = null;
    }

    return isValid;
  }

  Future<void> signup() async {
    if (!_validateForm()) return;

    isLoading.value = true;

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // Mock successful signup and navigation to OTP
    Get.toNamed(AppRoutes.OTP, arguments: {
      'email': emailController.text.trim(),
      'userId': 'mock_user_id',
    });
  }

  void goToLogin() {
    Get.back();
  }
}
