import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Custom app bar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.headlineSmall.copyWith(
          color: foregroundColor ?? AppColors.textPrimary,
        ),
      ),
      leading: showBackButton
          ? (leading ?? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ))
          : leading,
      actions: actions,
      backgroundColor: backgroundColor ?? AppColors.surface,
      foregroundColor: foregroundColor ?? AppColors.textPrimary,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBackButton,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
