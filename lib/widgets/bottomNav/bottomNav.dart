import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/const/resource.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_styles.dart';
import 'package:home_glam/widgets/app_image.dart';
import 'package:home_glam/widgets/bottomNav/bounce_tap.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.onChangeScreen,
    required this.screenIndex,
    this.isTransparentBackground = false,
  });

  final Function(int index) onChangeScreen;
  final int screenIndex;
  final bool isTransparentBackground;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight +
            (MediaQuery.paddingOf(context).bottom > 0 ? MediaQuery.paddingOf(context).bottom / 1.5 : 8),
        padding: EdgeInsets.only(left: 24, right: 24, bottom: MediaQuery.paddingOf(context).bottom / 2.5),
        decoration: BoxDecoration(
          color: AppColors.pramiryF1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItem(
                path: R.ASSETS_ICONS_HOME_SVG, pathActive: R.ASSETS_ICONS_HOME_ACTIVE_SVG, index: 0, title: "Home"),
            _buildItem(
                path: R.ASSETS_ICONS_CATEGORY_SVG,
                pathActive: R.ASSETS_ICONS_CHAT_ACTIVE_SVG,
                index: 1,
                title: "Category"),
            _buildItem(
                path: R.ASSETS_ICONS_CHAT_SVG, pathActive: R.ASSETS_ICONS_CHAT_ACTIVE_SVG, index: 2, title: "Chat"),
            _buildItem(
                path: R.ASSETS_ICONS_ACCOUNT_SVG,
                pathActive: R.ASSETS_ICONS_ACCOUNT_ACTIVE_SVG,
                index: 3,
                title: "Account"),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required String path,
    required String pathActive,
    required int index,
    double height = 24,
    double width = 24,
    required String title,
  }) {
    final isActive = screenIndex == index;
    return BounceTap(
      onTap: () => onChangeScreen(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImage(
            color: isActive ? AppColors.pramiry80 : AppColors.black32,
            path: isActive ? pathActive : path,
            height: height,
            width: width,
            fit: BoxFit.fill,
          ),
          const Gap(5),
          Text(
            title,
            style: AppTextStyles.text10.copyWith(
                fontFamily: AppFontFamily.poppins,
                color: isActive ? AppColors.pramiry80 : AppColors.black32,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
