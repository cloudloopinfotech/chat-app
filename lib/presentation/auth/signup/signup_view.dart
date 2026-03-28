import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: controller.goToLogin,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign up to get started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),

              // Username Field
              Obx(() => CustomTextField(
                    controller: controller.usernameController,
                    label: 'Username',
                    hint: 'Choose a username',
                    errorText: controller.usernameError.value,
                    prefixIcon: const Icon(Icons.person_outline),
                    onChanged: (_) => controller.usernameError.value = null,
                  )),
              const SizedBox(height: 20),

              // Email Field
              Obx(() => CustomTextField(
                    controller: controller.emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    errorText: controller.emailError.value,
                    prefixIcon: const Icon(Icons.email_outlined),
                    onChanged: (_) => controller.emailError.value = null,
                  )),
              const SizedBox(height: 20),

              // Password Field
              Obx(() => CustomTextField(
                    controller: controller.passwordController,
                    label: 'Password',
                    hint: 'Create a password',
                    obscureText: !controller.isPasswordVisible.value,
                    errorText: controller.passwordError.value,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    onChanged: (_) => controller.passwordError.value = null,
                  )),
              const SizedBox(height: 20),

              // Confirm Password Field
              Obx(() => CustomTextField(
                    controller: controller.confirmPasswordController,
                    label: 'Confirm Password',
                    hint: 'Re-enter your password',
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    errorText: controller.confirmPasswordError.value,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                    onChanged: (_) =>
                        controller.confirmPasswordError.value = null,
                  )),
              const SizedBox(height: 32),

              // Sign Up Button
              Obx(() => CustomButton(
                    text: 'Sign Up',
                    onPressed: controller.signup,
                    isLoading: controller.isLoading.value,
                    width: double.infinity,
                  )),
              const SizedBox(height: 24),

              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  TextButton(
                    onPressed: controller.goToLogin,
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
