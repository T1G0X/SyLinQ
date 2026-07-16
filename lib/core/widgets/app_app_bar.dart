import 'package:flutter/material.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_constants.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final bool centerTitle;
  final Widget? leading;

  const AppAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.actions,
    this.onBackPressed,
    this.showBackButton = true,
    this.backgroundColor = AppColors.surface,
    this.foregroundColor = AppColors.gray900,
    this.elevation = 0,
    this.bottom,
    this.centerTitle = false,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          (title != null
              ? Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w600,
            ),
          )
              : null),
      actions: actions,
      leading: leading ??
          (showBackButton
              ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: onBackPressed ??
                () => Navigator.of(context).pop(),
          )
              : null),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      bottom: bottom,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize.height ?? 0),
  );
}
