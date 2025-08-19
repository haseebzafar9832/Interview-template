import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/app_theme.dart';

/// Custom text field widget
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.autofocus = false,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppTheme.spacing8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          validator: validator,
          maxLines: maxLines,
          maxLength: maxLength,
          autofocus: autofocus,
          focusNode: focusNode,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText ?? label,
            prefixIcon:
                prefixIcon != null
                    ? Icon(prefixIcon, color: AppColors.textSecondary)
                    : null,
            suffixIcon:
                suffixIcon != null
                    ? IconButton(
                      onPressed: onSuffixIconPressed,
                      icon: Icon(suffixIcon, color: AppColors.textSecondary),
                    )
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radius12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radius12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radius12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radius12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacing16,
              vertical: AppTheme.spacing16,
            ),
            filled: !enabled,
            fillColor: enabled ? null : AppColors.background,
          ),
        ),
      ],
    );
  }
}
