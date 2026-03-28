import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'otp_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/constants/app_constants.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                const SizedBox(height: AppSizes.spacing40),

                // Animated Icon
                _buildAnimatedIcon(),
                const SizedBox(height: AppSizes.spacing40),

                // Header Text
              const Text(
                  'Enter Verification Code',
                style: TextStyle(
                    fontSize: AppSizes.fontSizeXXXL,
                  fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spacing12),

                // Subtitle
              Text(
                  'We sent a 6-digit code to\n${controller.phoneNumber}',
                  textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AppSizes.fontSizeM,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                ),
              ),
                const SizedBox(height: AppSizes.spacing56),

              // OTP Input Fields
                _buildOtpFields(context),
                const SizedBox(height: AppSizes.spacing40),

              // Verify Button
                _buildVerifyButton(context),
                const SizedBox(height: AppSizes.spacing32),

                // Resend Section
                Obx(() => _buildResendSection()),
                const SizedBox(height: AppSizes.spacing40),
            ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                  spreadRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              CupertinoIcons.lock,
              size: 50,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildOtpFields(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
        (index) => _buildOtpField(context, index),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 300 + (index * 100)),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Obx(() {
            final hasValue = controller.otpTexts[index].value.isNotEmpty;
            final isFilled = hasValue;
            final hasFocus = controller.focusStates[index].value;
            
            return GestureDetector(
              onTap: () {
                controller.focusNodes[index].requestFocus();
              },
              child: Container(
                width: 52,
                height: 64,
      decoration: BoxDecoration(
                  color: const Color(0xFF1F2C34),
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  border: Border.all(
                    color: hasFocus
                        ? AppColors.primary
                        : isFilled
                            ? AppColors.primary.withOpacity(0.5)
                            : Colors.grey[700]!,
                    width: hasFocus ? 2 : 1,
                  ),
                  boxShadow: hasFocus
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
                child: Center(
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
                      fontSize: AppSizes.fontSizeXXXL - 4,
          fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
                    onChanged: (value) {
                      controller.onOtpChanged(index, value);
                    },
        onTap: () {
          controller.otpControllers[index].clear();
        },
      ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return Obx(() {
      final isComplete = controller.otpComplete.value;

      return Container(
      width: double.infinity,
      height: AppSizes.buttonHeightM,
      decoration: BoxDecoration(
        gradient: isComplete
            ? const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isComplete ? null : Colors.grey[800],
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        boxShadow: isComplete
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isComplete && !controller.isLoading.value
              ? controller.verifyOtp
              : null,
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
                      Text(
                        'Verify',
                        style: TextStyle(
                          color: isComplete ? Colors.white : Colors.grey[500],
                          fontSize: AppSizes.fontSizeL,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      if (isComplete) ...[
                        const SizedBox(width: AppSizes.spacing8),
                        const Icon(
                          CupertinoIcons.check_mark_circled,
                          color: Colors.white,
                          size: AppSizes.iconSizeM,
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
    });
  }

  Widget _buildResendSection() {
    return Column(
      children: [
        Text(
          "Didn't receive the code?",
          style: TextStyle(
            fontSize: AppSizes.fontSizeM,
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(height: AppSizes.spacing12),
        Obx(() {
          if (controller.canResend.value) {
            return TextButton(
              onPressed: controller.resendOtp,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spacing24,
                  vertical: AppSizes.spacing12,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    CupertinoIcons.arrow_clockwise,
                    color: AppColors.primary,
                    size: AppSizes.iconSizeM,
                  ),
                  const SizedBox(width: AppSizes.spacing8),
                  const Text(
                    'Resend Code',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: AppSizes.fontSizeL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spacing24,
                vertical: AppSizes.spacing12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2C34),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.timer,
                    color: Colors.grey[500],
                    size: AppSizes.iconSizeM,
                  ),
                  const SizedBox(width: AppSizes.spacing8),
                  Text(
                    'Resend in ${controller.resendTimer.value}s',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: AppSizes.fontSizeM,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ],
    );
  }
}
