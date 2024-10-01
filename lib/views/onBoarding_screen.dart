import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/const/lists.dart';
import 'package:home_glam/routes/routes_name.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_navigator.dart';
import 'package:home_glam/utils/app_styles.dart';
import 'package:home_glam/utils/sharedPref/sharedPref.dart';

import 'package:home_glam/widgets/app_image.dart';
import 'package:home_glam/widgets/button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onBoardingModelList.length,
              itemBuilder: (context, index) {
                final model = onBoardingModelList[index];
                return Column(
                  children: [
                    Padding(padding: MediaQuery.paddingOf(context)),
                    AppImage(
                      path: model.image,
                      width: widht,
                      height: height * 0.6,
                      fit: BoxFit.cover,
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        model.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.text24.copyWith(fontWeight: FontWeight.w600, color: AppColors.pramiry),
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        textAlign: TextAlign.center,
                        model.subtitle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.text16.copyWith(fontWeight: FontWeight.w500, color: AppColors.black66),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onBoardingModelList.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 12,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _currentPage == index ? AppColors.pramiry : AppColors.grayEF,
                  ),
                );
              }),
            ),
          ),
          if (_currentPage == onBoardingModelList.length - 1) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Button(
                      press: () {
                        goToNextScreen(context);
                      },
                      width: 138,
                      text: "Get Started")),
            )
          ]
        ],
      ),
    );
  }

  goToNextScreen(BuildContext context) {
    setOnboarding();
    AppNavigator.pushReplacementNamed(context, RoutesName.selectLocationScreen);
  }
}
