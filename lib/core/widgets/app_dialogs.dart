import 'package:flutter/material.dart';
import '../../config/constants/app_colors.dart';

class AppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool useRootNavigator = true,
    Color backgroundColor = AppColors.surface,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    AnimationController? transitionAnimationController,
    Duration? enterBottomSheetDuration,
    Duration? exitBottomSheetDuration,
    RouteSettings? routeSettings,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      isDismissible: isDismissible,
      useRootNavigator: useRootNavigator,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      transitionAnimationController: transitionAnimationController,
      routeSettings: routeSettings,
    );
  }
}

class AppDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: actions,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    );
  }
}
