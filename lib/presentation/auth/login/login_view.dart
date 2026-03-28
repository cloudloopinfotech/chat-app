import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'login_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/app_logo.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                const SizedBox(height: AppSizes.spacing64),

                // Logo Section
                const Center(
                  child: AppLogo(
                    size: 80,
                    showGradient: true,
                ),
              ),
                const SizedBox(height: AppSizes.spacing40),

                // Header Text
              const Text(
                'Enter your phone number',
                style: TextStyle(
                    fontSize: AppSizes.fontSizeXXXL,
                  fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spacing12),
              Text(
                'We will send you a verification code',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppSizes.fontSizeM,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400,
                ),
              ),
                const SizedBox(height: AppSizes.spacing56),

                // Phone Number Input Section
                Obx(() => _buildPhoneInput(context)),
                const SizedBox(height: AppSizes.spacing40),

                // Continue Button
                Obx(() => _buildContinueButton(context)),
                const SizedBox(height: AppSizes.spacing32),

                // Terms & Privacy
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeS,
                        color: Colors.grey[500],
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(text: 'By continuing, you agree to our '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spacing40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneInput(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        // Label
        Text(
          AppStrings.phoneNumber,
          style: const TextStyle(
            fontSize: AppSizes.fontSizeM,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppSizes.spacing12),

        // Country Code & Phone Input Row
        Row(
          children: [
            // Country Code Selector
                  Container(
              width: 90,
              height: AppSizes.textFieldHeight,
                    decoration: BoxDecoration(
                color: const Color(0xFF1F2C34),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(
                  color: controller.phoneError.value != null
                      ? AppColors.error
                      : Colors.grey[700]!,
                  width: 1,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Show country code picker
                    Get.snackbar(
                      'Country Code',
                      'Country code picker coming soon',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '🇮🇳',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: AppSizes.spacing8),
                      const Text(
                        '+91',
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeL,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: AppSizes.spacing4),
                      Icon(
                        CupertinoIcons.chevron_down,
                        color: Colors.grey[400],
                        size: 20,
                      ),
                    ],
                        ),
                      ),
                    ),
                  ),
            const SizedBox(width: AppSizes.spacing12),

                  // Phone Number Field
                  Expanded(
              child: Container(
                height: AppSizes.textFieldHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2C34),
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  border: Border.all(
                    color: controller.phoneError.value != null
                        ? AppColors.error
                        : Colors.grey[700]!,
                    width: 1,
                  ),
                ),
                child: TextField(
                          controller: controller.phoneController,
                          keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.fontSizeL,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: AppSizes.fontSizeM,
                    ),
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                      color: Colors.grey[400],
                      size: AppSizes.iconSizeM,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingM,
                      vertical: AppSizes.spacing16,
                    ),
                  ),
                          onChanged: (_) => controller.phoneError.value = null,
                ),
              ),
                  ),
                ],
              ),

        // Error Message
        if (controller.phoneError.value != null) ...[
          const SizedBox(height: AppSizes.spacing8),
          Row(
            children: [
              Icon(
                CupertinoIcons.exclamationmark_circle,
                size: AppSizes.iconSizeS,
                color: AppColors.error,
              ),
              const SizedBox(width: AppSizes.spacing4),
              Expanded(
                child: Text(
                  controller.phoneError.value!,
                  style: TextStyle(
                    color: AppColors.error,
                    fontSize: AppSizes.fontSizeS,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.buttonHeightM,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: controller.isLoading.value ? null : controller.sendOTP,
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          child: Container(
            alignment: Alignment.center,
            child: controller.isLoading.value
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.continue_,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSizes.fontSizeL,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(width: AppSizes.spacing8),
                        const Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.white,
                          size: AppSizes.iconSizeM,
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
