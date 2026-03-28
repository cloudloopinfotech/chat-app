import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../app/themes/app_colors.dart';

/// CliChat App Logo Widget
/// A reusable logo widget that can be used throughout the app
class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;
  final bool showGradient;
  final bool animated;

  const AppLogo({
    super.key,
    this.size = 90,
    this.color,
    this.showGradient = false,
    this.animated = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget logo = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: showGradient
            ? const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: showGradient ? null : (color ?? AppColors.primary),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: (color ?? AppColors.primary).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'CC',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.4,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );

    if (animated) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: logo,
          );
        },
      );
    }

    return logo;
  }
}

/// CliChat App Logo with Icon (Alternative design)
class AppLogoWithIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final bool showGradient;

  const AppLogoWithIcon({
    super.key,
    this.size = 90,
    this.color,
    this.showGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: showGradient
            ? const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: showGradient ? null : (color ?? AppColors.primary),
        borderRadius: BorderRadius.circular(size * 0.2),
        boxShadow: [
          BoxShadow(
            color: (color ?? AppColors.primary).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.chat_bubble_2_fill,
          color: Colors.white,
          size: size * 0.6,
        ),
      ),
    );
  }
}

