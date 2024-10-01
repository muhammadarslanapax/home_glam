import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/const/consts.dart';
import 'package:home_glam/const/resource.dart';
import 'package:home_glam/routes/routes_name.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_navigator.dart';
import 'package:home_glam/utils/app_styles.dart';
import 'package:home_glam/utils/sharedPref/sharedPref.dart';
import 'package:home_glam/widgets/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
    _goToNextScreen(context);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(gradient: AppColors.maingradient),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppImage(path: R.ASSETS_ICONS_SPLASHIC_SVG),
              const Gap(20),
              buildMainText(),
            ],
          ),
        ),
      ),
    );
  }

  _goToNextScreen(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      if (isNewUser) {
        AppNavigator.pushReplacementNamed(context, RoutesName.selectLocationScreen);
      } else {
        AppNavigator.pushReplacementNamed(context, RoutesName.onboarding);
      }
    });
  }
}

Text buildMainText() {
  return Text(
    AppConsts.homeGlam,
    style: AppTextStyles.text32
        .copyWith(color: AppColors.black66, fontWeight: FontWeight.w800, fontFamily: AppFontFamily.mulish),
  );
}
