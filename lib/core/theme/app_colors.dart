import 'package:flutter/material.dart';

/// Semantic colors for the app, designed for high contrast and accessibility.
class AppColors {
  AppColors._();

  // Day classification colors
  static const Color greenDay = Color(0xFF2E7D32);
  static const Color yellowDay = Color(0xFFF57F17);
  static const Color redDay = Color(0xFFC62828);

  // Day classification backgrounds (lighter)
  static const Color greenDayBg = Color(0xFFE8F5E9);
  static const Color yellowDayBg = Color(0xFFFFF8E1);
  static const Color redDayBg = Color(0xFFFFEBEE);

  // Primary palette
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF0D47A1);

  // Surface and background
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Text
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF616161);
  static const Color textOnPrimary = Colors.white;
  static const Color textOnDanger = Colors.white;

  // Actions
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF57F17);
  static const Color danger = Color(0xFFC62828);
  static const Color dangerBg = Color(0xFFD32F2F);

  // Choking FAB
  static const Color chokingFab = Color(0xFF1565C0);
  static const Color chokingFabPressed = Color(0xFF0D47A1);

  // Borders and dividers
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // Disabled
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color disabledBg = Color(0xFFE0E0E0);

  // Checklist
  static const Color checklistDone = Color(0xFF2E7D32);
  static const Color checklistPending = Color(0xFFBDBDBD);
  static const Color checklistRequired = Color(0xFFC62828);
}
