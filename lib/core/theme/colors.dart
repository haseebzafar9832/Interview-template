import 'package:flutter/material.dart';

/// App color palette
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors

  static const Color primary = Color(0xFF440C7E);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1D4ED8);

  // Secondary Colors
  static const Color secondary = Color(0xFFF2F2F2);
  static const Color secondaryLight = Color(0xFFBCBCBC);
  static const Color secondaryDark = Color(0xFF999999);

  // Accent Colors
  static const Color accent = Color(0xFFF59E0B);
  static const Color accentLight = Color(0xFFFBBF24);
  static const Color accentDark = Color(0xFFD97706);

  // Background Colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color card = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textInverse = Color(0xFF8130EFF);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Border Colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color shadow = Color(0x0A000000);

  // Semantic Colors
  static const Color link = Color(0xFF3B82F6);
  static const Color disabled = Color(0xFFCBD5E1);
  static const Color selected = Color(0xFFDBEAFE);
  static const Color hover = Color(0xFFF1F5F9);

  static const Color cardColor = Color(0xffFCFCFC);
  // Material 3 Color Scheme
  static ColorScheme get lightColorScheme => const ColorScheme.light(
    primary: primary,
    secondary: secondary,
    tertiary: accent,
    surface: surface,
    background: background,
    error: error,
    onPrimary: textInverse,
    onSecondary: textInverse,
    onTertiary: textInverse,
    onSurface: textPrimary,
    onBackground: textPrimary,
    onError: textInverse,
  );

  static ColorScheme get darkColorScheme => const ColorScheme.dark(
    primary: primaryLight,
    secondary: secondaryLight,
    tertiary: accentLight,
    surface: Color(0xFF1E293B),
    background: Color(0xFF0F172A),
    error: error,
    onPrimary: textInverse,
    onSecondary: textInverse,
    onTertiary: textInverse,
    onSurface: textInverse,
    onBackground: textInverse,
    onError: textInverse,
  );

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow Colors
  static List<BoxShadow> get shadowSmall => [
    const BoxShadow(
      color: shadow,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get shadowMedium => [
    const BoxShadow(
      color: shadow,
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
    ),
  ];

  static List<BoxShadow> get shadowLarge => [
    const BoxShadow(
      color: shadow,
      offset: Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
  ];
}
