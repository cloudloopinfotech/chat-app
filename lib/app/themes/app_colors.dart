import 'package:flutter/material.dart';

/// Application color palette
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6C5CE7);
  static const Color primaryDark = Color(0xFF5F3DC4);
  static const Color primaryLight = Color(0xFF9775FA);

  // Accent Colors
  static const Color accent = Color(0xFF00D9FF);
  static const Color accentDark = Color(0xFF00B8D4);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF1A1A2E);
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF16213E);

  // Text Colors
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color textLight = Colors.white;
  static const Color textDark = Color(0xFF2D3436);

  // Message Bubble Colors
  static const Color sentMessage = Color(0xFF6C5CE7);
  static const Color receivedMessage = Color(0xFFE9ECEF);
  static const Color receivedMessageDark = Color(0xFF2C3E50);

  // Status Colors
  static const Color online = Color(0xFF00D084);
  static const Color offline = Color(0xFF95A5A6);
  static const Color away = Color(0xFFFDCB6E);
  static const Color busy = Color(0xFFFF6B6B);

  // Functional Colors
  static const Color success = Color(0xFF00D084);
  static const Color error = Color(0xFFFF6B6B);
  static const Color warning = Color(0xFFFDCB6E);
  static const Color info = Color(0xFF00D9FF);

  // Neutral Colors
  static const Color divider = Color(0xFFDFE6E9);
  static const Color dividerDark = Color(0xFF2C3E50);
  static const Color border = Color(0xFFB2BEC3);
  static const Color borderDark = Color(0xFF34495E);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
