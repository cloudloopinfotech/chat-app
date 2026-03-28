import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/app_logo.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
              AppColors.primaryLight,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Animated floating particles
              ...List.generate(8, (index) => _buildFloatingParticle(index)),
              
              // Wave animation at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildWaveAnimation(),
              ),

              // Main Content
              Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    // Pulsing Logo with rotation
                    _buildPulsingLogo(),
                    const SizedBox(height: AppSizes.spacing40),

                    // App Name with typewriter effect
                    _buildAnimatedAppName(),
                    const SizedBox(height: AppSizes.spacing16),

                    // Tagline with fade and slide
                    _buildAnimatedTagline(),
                    const SizedBox(height: AppSizes.spacing80),

                    // Animated dots indicator
                    _buildAnimatedDots(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingParticle(int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 2 * math.pi),
      duration: Duration(milliseconds: 3000 + (index * 500)),
      curve: Curves.linear,
      builder: (context, value, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final radius = 100.0 + (index * 30.0);
        final x = screenWidth / 2 + radius * math.cos(value + index);
        final y = screenHeight / 2 + radius * math.sin(value + index);
        
        return Positioned(
          left: x,
          top: y,
          child: Container(
            width: 8 + (index % 3) * 4,
            height: 8 + (index % 3) * 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3 - (index * 0.03)),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWaveAnimation() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 150),
          painter: WavePainter(value),
        );
      },
    );
  }

  Widget _buildPulsingLogo() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOutBack,
      builder: (context, scaleValue, child) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeInOut,
          builder: (context, pulseValue, child) {
            final pulse = 1.0 + (math.sin(pulseValue * 2 * math.pi) * 0.1);
            return Transform.scale(
              scale: scaleValue * pulse,
              child: Transform.rotate(
                angle: (pulseValue * 0.1) * math.pi,
                child: Container(
                  width: AppSizes.avatarSizeXXXL,
                  height: AppSizes.avatarSizeXXXL,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Color(0xFFF0F0F0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 40,
                        offset: const Offset(0, 20),
                        spreadRadius: 10,
                      ),
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.5),
                        blurRadius: 60,
                        offset: const Offset(0, 0),
                        spreadRadius: 20,
                    ),
                  ],
                ),
                  child: const AppLogo(
                    size: 90,
                    showGradient: true,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAnimatedAppName() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.white, Colors.white70],
              ).createShader(bounds),
              child: const Text(
                AppStrings.appName,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeHuge + 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedTagline() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1800),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: Text(
              AppStrings.appTagline,
                style: TextStyle(
                fontSize: AppSizes.fontSizeL + 2,
                color: Colors.white.withOpacity(0.95),
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                ),
              ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 600 + (index * 200)),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 12 + (math.sin(value * 2 * math.pi) * 4),
              height: 12 + (math.sin(value * 2 * math.pi) * 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.8 + (math.sin(value * 2 * math.pi) * 0.2)),
              ),
            );
          },
        );
      }),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveLength = size.width / 2;
    final waveHeight = 30.0;

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x++) {
      final y = waveHeight * math.sin((x / waveLength + animationValue) * 2 * math.pi) + size.height - 50;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
