import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants/app_constants.dart';
import 'glass_container.dart';

/// Reusable settings item widget with glassmorphism
class SettingsItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? value;
  final IconData? icon;
  final Color? titleColor;
  final VoidCallback? onTap;
  final bool showChevron;

  const SettingsItem({
    super.key,
    required this.title,
    this.subtitle,
    this.value,
    this.icon,
    this.titleColor,
    this.onTap,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spacing16,
        vertical: AppSizes.spacing14,
      ),
      margin: const EdgeInsets.only(bottom: AppSizes.spacing6),
      borderRadius: BorderRadius.circular(AppSizes.radiusM),
      blur: 10,
      opacity: 0.1,
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              padding: const EdgeInsets.all(AppSizes.spacing8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusS),
              ),
              child: Icon(icon, color: Colors.white, size: AppSizes.iconSizeM),
            ),
            const SizedBox(width: AppSizes.spacing16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor ?? Colors.white,
                    fontSize: AppSizes.fontSizeM,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppSizes.spacing4),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: AppSizes.fontSizeS,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (value != null) ...[
            Text(
              value!,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: AppSizes.fontSizeS,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: AppSizes.spacing8),
          ],
          if (showChevron && onTap != null)
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.grey[500],
              size: AppSizes.iconSizeS,
            ),
        ],
      ),
    );
  }
}

/// Settings switch item with glassmorphism
class SettingsSwitchItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final Function(bool) onChanged;
  final IconData? icon;

  const SettingsSwitchItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spacing16,
        vertical: AppSizes.spacing14,
      ),
      margin: const EdgeInsets.only(bottom: AppSizes.spacing6),
      borderRadius: BorderRadius.circular(AppSizes.radiusM),
      blur: 10,
      opacity: 0.1,
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              padding: const EdgeInsets.all(AppSizes.spacing8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusS),
              ),
              child: Icon(icon, color: Colors.white, size: AppSizes.iconSizeM),
            ),
            const SizedBox(width: AppSizes.spacing16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.fontSizeM,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppSizes.spacing4),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: AppSizes.fontSizeS,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSizes.spacing8),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

