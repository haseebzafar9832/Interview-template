import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

/// App text styles
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // Font Family
  static const String fontFamily = 'Inter';

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Display Styles
  static TextStyle get displayLarge => TextStyle(
    fontSize: 32.sp,
    fontWeight: bold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle get displayMedium => TextStyle(
    fontSize: 28.sp,
    fontWeight: bold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle get displaySmall => TextStyle(
    fontSize: 24.sp,
    fontWeight: bold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // Headline Styles
  static TextStyle get headlineLarge => TextStyle(
    fontSize: 22.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle get headlineMedium => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle get headlineMedium2 => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle get headlineSmall => TextStyle(
    fontSize: 18.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // Title Styles
  static TextStyle get titleLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle get titleMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static TextStyle get titleSmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body Styles
  static TextStyle get bodyLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle get bodySmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Label Styles

  static TextStyle get labelMedium => TextStyle(
    fontSize: 12.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static TextStyle get labelSmall => TextStyle(
    fontSize: 10.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.textTertiary,
    height: 1.4,
  );
  static TextStyle get labelLarge => TextStyle(
    fontSize: 25.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    height: 1.4,
  );

  // Button Styles
  static TextStyle get buttonLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    color: AppColors.textInverse,
    height: 1.4,
  );

  static TextStyle get buttonMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    height: 1.4,
  );

  static TextStyle get buttonSmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: semiBold,
    fontFamily: fontFamily,
    color: AppColors.textInverse,
    height: 1.4,
  );

  // Caption Styles
  static TextStyle get caption => TextStyle(
    fontSize: 12.sp,
    fontWeight: regular,
    fontFamily: fontFamily,
    color: AppColors.textTertiary,
    height: 1.4,
  );

  static TextStyle get overline => TextStyle(
    fontSize: 10.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.textTertiary,
    height: 1.4,
    letterSpacing: 1.5,
  );

  // Custom Styles
  static TextStyle get link => TextStyle(
    fontSize: 14.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.link,
    height: 1.4,
    decoration: TextDecoration.underline,
  );

  static TextStyle get error => TextStyle(
    fontSize: 12.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.error,
    height: 1.4,
  );

  static TextStyle get success => TextStyle(
    fontSize: 12.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.success,
    height: 1.4,
  );

  static TextStyle get warning => TextStyle(
    fontSize: 12.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.warning,
    height: 1.4,
  );

  static TextStyle get info => TextStyle(
    fontSize: 12.sp,
    fontWeight: medium,
    fontFamily: fontFamily,
    color: AppColors.info,
    height: 1.4,
  );

  // Helper Methods
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  static TextStyle withHeight(TextStyle style, double height) {
    return style.copyWith(height: height);
  }
}
