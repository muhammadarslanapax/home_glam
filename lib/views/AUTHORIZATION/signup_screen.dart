import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_styles.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Text(
                "Welcome to",
                style: AppTextStyles.text24.copyWith(fontWeight: FontWeight.w500, fontFamily: AppFontFamily.poppins),
              ),
              const Gap(8),
              Text(
                "HomeGlam",
                style: AppTextStyles.text32.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.pramiry80, fontFamily: AppFontFamily.poppins),
              ),
              const Gap(6),
              Text(
                textAlign: TextAlign.center,
                "Sign up as a customer to buy our services",
                style: AppTextStyles.text20
                    .copyWith(fontWeight: FontWeight.w600, color: AppColors.black0F, fontFamily: AppFontFamily.mulish),
              ),
              const Gap(12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: AppTextStyles.text14.copyWith(fontFamily: AppFontFamily.poppins, color: AppColors.black32),
                  ),
                  const Gap(8),
                  SizedBox(
                    height: 52,
                    child: TextFormField(
                      decoration: InputDecoration(
                          
                        
                        isDense: true,
                        filled: true,
                        fillColor: AppColors.pramiryF1,
                        border: OutlineInputBorder(
                          
                          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
