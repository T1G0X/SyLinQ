import 'package:flutter/material.dart';
import '../../config/constants/app_colors.dart';
import '../../config/constants/app_constants.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color textColor;

  const AppAvatar({
    Key? key,
    this.imageUrl,
    this.initials,
    this.size = AppConstants.avatarMd,
    this.onTap,
    this.backgroundColor = AppColors.primaryContainer,
    this.textColor = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar = CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor,
      backgroundImage:
          imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
        initials ?? 'U',
        style: TextStyle(
          fontSize: size / 2.5,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      )
          : null,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: avatar,
      );
    }

    return avatar;
  }
}

class AppAvatarGroup extends StatelessWidget {
  final List<String?> imageUrls;
  final double size;
  final int maxVisible;
  final VoidCallback? onTap;

  const AppAvatarGroup({
    Key? key,
    required this.imageUrls,
    this.size = AppConstants.avatarMd,
    this.maxVisible = 3,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visible = imageUrls.take(maxVisible).toList();
    final remaining = imageUrls.length - maxVisible;

    return Row(
      children: [
        ...visible.asMap().entries.map((entry) {
          return Transform.translate(
            offset: Offset(entry.key * -8.0, 0),
            child: AppAvatar(
              imageUrl: entry.value,
              size: size,
            ),
          );
        }).toList(),
        if (remaining > 0)
          Transform.translate(
            offset: Offset(visible.length * -8.0, 0),
            child: CircleAvatar(
              radius: size / 2,
              backgroundColor: AppColors.primaryContainer,
              child: Text(
                '+$remaining',
                style: TextStyle(
                  fontSize: size / 2.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
