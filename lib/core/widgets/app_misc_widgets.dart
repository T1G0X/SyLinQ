import 'package:flutter/material.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_constants.dart';

class AppBadge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const AppBadge({
    Key? key,
    required this.label,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.fontSize = 12,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ??
            BorderRadius.circular(AppConstants.radiusFull),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double thickness;
  final double? indent;
  final double? endIndent;

  const AppDivider({
    Key? key,
    this.color = AppColors.gray200,
    this.height = 1,
    this.thickness = 1,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

class AppChip extends StatelessWidget {
  final String label;
  final VoidCallback? onDeleted;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color labelColor;
  final IconData? icon;
  final bool selected;

  const AppChip({
    Key? key,
    required this.label,
    this.onDeleted,
    this.onPressed,
    this.backgroundColor = AppColors.gray100,
    this.labelColor = AppColors.gray900,
    this.icon,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: labelColor),
      ),
      backgroundColor: selected ? AppColors.primary : backgroundColor,
      onDeleted: onDeleted,
      deleteIcon:
          onDeleted != null ? const Icon(Icons.close) : null,
      avatar: icon != null ? Icon(icon) : null,
      onPressed: onPressed,
    );
  }
}
