import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/const/resource.dart';
import 'package:home_glam/routes/routes_name.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_navigator.dart';
import 'package:home_glam/utils/app_styles.dart';
import 'package:home_glam/views/splash_screen.dart';
import 'package:home_glam/widgets/app_image.dart';

class LocationandroleScreen extends StatefulWidget {
  const LocationandroleScreen({super.key});

  @override
  State<LocationandroleScreen> createState() => _LocationandroleScreenState();
}

class _LocationandroleScreenState extends State<LocationandroleScreen> {
  String? stateValue;
  String? countryValue;
  String? cityValue;
  int? selectedRole;
  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        child: SizedBox(
          width: widht,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 20)),
              buildLogo(),
              const Gap(10),
              buildMainText(),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  textAlign: TextAlign.center,
                  "Select your country and add your location",
                  style: AppTextStyles.text20.copyWith(
                      fontSize: 22,
                      fontFamily: AppFontFamily.mulish,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black32),
                ),
              ),
              const Gap(30),
              CSCPicker(
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
              const Spacer(),
              if (countryValue != null && stateValue != null && cityValue != null) ...[
                Text(
                  textAlign: TextAlign.center,
                  "Select weather you are a bussiness or customer",
                  style: AppTextStyles.text20
                      .copyWith(fontFamily: AppFontFamily.mulish, fontSize: 22, color: AppColors.black32),
                ),
                const Gap(30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRole = 1;
                    });

                    AppNavigator.pushReplacementNamed(context, RoutesName.signupRoute);
                  },
                  child: Container(
                    width: widht,
                    height: 60,
                    decoration: BoxDecoration(
                        color: selectedRole == 1 ? AppColors.pramiry80 : AppColors.redCE,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        "Bussiness/ Shop",
                        style: AppTextStyles.text20.copyWith(
                            fontFamily: AppFontFamily.mulish,
                            fontWeight: FontWeight.w500,
                            color: selectedRole == 1 ? AppColors.white : AppColors.black32),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRole = 2;
                    });
                    AppNavigator.pushReplacementNamed(context, RoutesName.signupRoute);
                  },
                  child: Container(
                    width: widht,
                    height: 60,
                    decoration: BoxDecoration(
                        color: selectedRole == 2 ? AppColors.pramiry80 : AppColors.redCE,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        "Customer",
                        style: AppTextStyles.text20.copyWith(
                            fontFamily: AppFontFamily.mulish,
                            fontWeight: FontWeight.w500,
                            color: selectedRole == 2 ? AppColors.white : AppColors.black32),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

AppImage buildLogo() {
  return const AppImage(
    path: R.ASSETS_ICONS_SPLASHIC_SVG,
    width: 78,
    height: 86,
    fit: BoxFit.cover,
  );
}
