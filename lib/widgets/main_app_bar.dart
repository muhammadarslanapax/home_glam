import 'package:flutter/material.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_navigator.dart';
import 'package:home_glam/utils/app_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.onClose,
    this.title,
    this.titleWidget,
    this.elevation = 0,
    this.leading,
    this.scrolledUnderElevation,
    this.actions,
    this.backgroundColor,
  });

  final Function()? onClose;
  final double height;
  final String? title;
  final Widget? titleWidget;
  final double elevation;
  final Widget? leading;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final canPop = AppNavigator.canPop(context);

    return CustomAppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      scrolledUnderElevation: scrolledUnderElevation,
      actions: actions,
      canPop: canPop,
      leading: leading,
      titleWidget: titleWidget,
      title: title,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.elevation,
    required this.scrolledUnderElevation,
    required this.actions,
    required this.canPop,
    this.leading,
    this.titleWidget,
    this.title,
    this.backgroundColor,
  });

  final double elevation;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final bool canPop;
  final Widget? leading;
  final Widget? titleWidget;
  final String? title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final canPop = AppNavigator.canPop(context);

    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.pramiry,
      elevation: elevation,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: scrolledUnderElevation,
      centerTitle: true,
      leadingWidth: 48,
      actions: actions,
      leading: !canPop
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: leading ??
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      splashRadius: 20,
                      splashColor: AppColors.grayEF.withOpacity(.2),
                      icon: Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () {
                        AppNavigator.pop(context);
                      },
                    ),
                  ),
            ),
      title: titleWidget ??
          (title == null
              ? const SizedBox()
              : Text(
                  title!,
                  style: AppTextStyles.textMed20.copyWith(color: Colors.white),
                )),
    );
  }
}
