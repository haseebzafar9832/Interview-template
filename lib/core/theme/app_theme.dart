import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'text_styles.dart';

/// App theme configuration
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Spacing constants
  static const double spacing4 = 3.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;

  // Border radius constants
  static const double radius4 = 4.0;
  static const double radius8 = 8.0;
  static const double radius12 = 12.0;
  static const double radius16 = 16.0;
  static const double radius20 = 20.0;
  static const double radius24 = 24.0;
  static const double radius32 = 32.0;

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextStyles.fontFamily,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: AppColors.lightColorScheme,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headlineSmall,
        iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius16),
        ),
        shadowColor: AppColors.shadow,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textInverse,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: spacing24,
            vertical: spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius12),
          ),
          textStyle: AppTextStyles.buttonLarge,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          padding: EdgeInsets.symmetric(
            horizontal: spacing24,
            vertical: spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius12),
          ),
          textStyle: AppTextStyles.buttonLarge,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: spacing16,
            vertical: spacing12,
          ),
          textStyle: AppTextStyles.buttonLarge,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing16,
          vertical: spacing16,
        ),
        hintStyle: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.textTertiary,
        ),
        labelStyle: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.textSecondary,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.textSecondary, size: 24),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.background,
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextStyles.fontFamily,
      brightness: Brightness.dark,

      // Color Scheme
      colorScheme: AppColors.darkColorScheme,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkColorScheme.surface,
        foregroundColor: AppColors.darkColorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headlineSmall.copyWith(
          color: AppColors.darkColorScheme.onSurface,
        ),
        iconTheme: IconThemeData(
          color: AppColors.darkColorScheme.onSurface,
          size: 24,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.darkColorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius16),
        ),
        shadowColor: AppColors.shadow,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.textInverse,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: spacing24,
            vertical: spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius12),
          ),
          textStyle: AppTextStyles.buttonLarge,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.primaryLight, width: 1.5),
          padding: EdgeInsets.symmetric(
            horizontal: spacing24,
            vertical: spacing16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius12),
          ),
          textStyle: AppTextStyles.buttonLarge,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          padding: EdgeInsets.symmetric(
            horizontal: spacing16,
            vertical: spacing12,
          ),
          textStyle: AppTextStyles.buttonLarge,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkColorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: BorderSide(color: AppColors.darkColorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: BorderSide(color: AppColors.darkColorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing16,
          vertical: spacing16,
        ),
        hintStyle: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.darkColorScheme.onSurface.withOpacity(0.6),
        ),
        labelStyle: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.darkColorScheme.onSurface.withOpacity(0.8),
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        displayMedium: AppTextStyles.displayMedium.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        displaySmall: AppTextStyles.displaySmall.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        titleLarge: AppTextStyles.titleLarge.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        titleMedium: AppTextStyles.titleMedium.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        titleSmall: AppTextStyles.titleSmall.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        bodySmall: AppTextStyles.bodySmall.copyWith(
          color: AppColors.darkColorScheme.onBackground.withOpacity(0.8),
        ),
        labelLarge: AppTextStyles.labelLarge.copyWith(
          color: AppColors.darkColorScheme.onBackground,
        ),
        labelMedium: AppTextStyles.labelMedium.copyWith(
          color: AppColors.darkColorScheme.onBackground.withOpacity(0.8),
        ),
        labelSmall: AppTextStyles.labelSmall.copyWith(
          color: AppColors.darkColorScheme.onBackground.withOpacity(0.6),
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.darkColorScheme.onSurface.withOpacity(0.8),
        size: 24,
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: AppColors.darkColorScheme.outline.withOpacity(0.2),
        thickness: 1,
        space: 1,
      ),

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.darkColorScheme.background,
    );
  }
}
