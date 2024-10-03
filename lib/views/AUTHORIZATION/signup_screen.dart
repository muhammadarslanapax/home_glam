// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/const/consts.dart';
import 'package:home_glam/routes/routes_name.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_navigator.dart';
import 'package:home_glam/utils/app_styles.dart';
import 'package:home_glam/utils/validations/text_field_validation.dart';
import 'package:home_glam/widgets/app_image.dart';
import 'package:home_glam/widgets/button.dart';
import 'package:home_glam/widgets/primary_divider.dart';
import 'package:home_glam/widgets/primary_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with TextFieldValidation {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(24.0.w),
        child: SizedBox(
          width: width,
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                 Gap(30.h),
                Text(
                  AppConsts.welcomeTo,
                  style: AppTextStyles.text24.copyWith(fontWeight: FontWeight.w500, fontFamily: AppFontFamily.poppins),
                ),
                Gap(8.h),
                Text(
                  AppConsts.homeGlam,
                  style: AppTextStyles.text32.copyWith(
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600,
                      color: AppColors.pramiry80,
                      fontFamily: AppFontFamily.poppins),
                ),
                Gap(6.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppConsts.signUpAs,
                    style: AppTextStyles.text20.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.black0F, fontFamily: AppFontFamily.mulish),
                  ),
                ),
                Gap(12.h),
                PrimaryTextField(
                  textInputAction: TextInputAction.next,
                  controller: _nameController,
                  hint: AppConsts.name,
                  validator: (val) => validateName(val),
                ),
                Gap(12.h),
                PrimaryTextField(
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  hint: AppConsts.email,
                  validator: (val) => validateEmail(val),
                ),
                Gap(12.h),
                PrimaryTextField(
                  textInputAction: TextInputAction.next,
                  controller: _passwordController,
                  hint: AppConsts.password,
                  validator: (val) => validatePassword(val),
                ),
                Gap(12.h),
                PrimaryTextField(
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                  hint: AppConsts.phone,
                  validator: (val) => validatePhoneNumber(val),
                ),
                Gap(36.h),
                PrimaryButton(onpress: () {}, text: AppConsts.signUp),
                buildDivider(),
                _buildSocialLogin(),
                _buildAlreadyAcount()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlreadyAcount() {
    return Padding(
        padding: EdgeInsets.only(
          top: 20.h,
        ),
        child: GestureDetector(
          onTap: () {
            AppNavigator.pushReplacementNamed(context, RoutesName.signinRoute);
          },
          child: RichText(
              text: TextSpan(
                  children: [
                TextSpan(
                    text: AppConsts.login,
                    style: AppTextStyles.text16.copyWith(color: AppColors.pramiry, fontWeight: FontWeight.w600))
              ],
                  text: AppConsts.alreadyHave,
                  style: AppTextStyles.text16
                      .copyWith(height: 1.7, fontWeight: FontWeight.w500, letterSpacing: 2, color: AppColors.black32))),
        ));
  }

  Widget _buildSocialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.grayF1),
            child: const AppImage(path: "assets/icons/google.svg"),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.grayF1),
            child: const AppImage(path: "assets/icons/facebook.svg"),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            width: 50,
            height: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.grayF1),
            child: const AppImage(path: "assets/icons/apple.svg"),
          ),
        ),
      ],
    );
  }
}
