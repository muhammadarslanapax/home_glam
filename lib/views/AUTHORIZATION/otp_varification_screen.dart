import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/const/consts.dart';
import 'package:home_glam/routes/routes_name.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_navigator.dart';
import 'package:home_glam/utils/app_styles.dart';
import 'package:home_glam/widgets/button.dart';
import 'package:home_glam/widgets/main_app_bar.dart';

class OtpVarificationScreen extends StatefulWidget {
  const OtpVarificationScreen({super.key});

  @override
  State<OtpVarificationScreen> createState() => _OtpVarificationScreenState();
}

class _OtpVarificationScreenState extends State<OtpVarificationScreen> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  void _onOtpChanged(int index, String value) {
    if (value.isNotEmpty && value.length == 1) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        verifyCode();
      }
    }
  }

  void verifyCode() {
    String otpCode = _controllers.map((controller) => controller.text).join();
    if (kDebugMode) {
      print('OTP Code: $otpCode');
    }
  }

  Widget otpTextField(int index) {
    return SizedBox(
      width: 45,
      child: TextFormField(
        cursorColor: AppColors.pramiry,
        focusNode: _focusNodes[index],
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) => _onOtpChanged(index, value),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.pramiry80, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.pramiry80, width: 3),
          ),
        ),
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MainAppBar(
        backgroundColor: AppColors.white,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            splashRadius: 20,
            splashColor: AppColors.grayEF.withOpacity(.2),
            icon: Icon(Icons.arrow_back, color: AppColors.black32),
            onPressed: () {
              AppNavigator.pop(context);
            },
          ),
        ),
        titleWidget: Text(
          AppConsts.verification,
          style: AppTextStyles.text24.copyWith(fontWeight: FontWeight.w500, fontFamily: AppFontFamily.poppins),
        ),
      ),
     
     
     
      body: Padding(
        padding: EdgeInsets.all(24.0.w),
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              Gap(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  textAlign: TextAlign.center,
                  AppConsts.enterOtp,
                  style: AppTextStyles.text20.copyWith(
                      height: 1.5,
                      letterSpacing: 1.0,
                      fontFamily: AppFontFamily.mulish,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black0F),
                ),
              ),
              Gap(48.h),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  AppConsts.enterOTP,
                  style: AppTextStyles.text18.copyWith(
                      fontWeight: FontWeight.w500, fontFamily: AppFontFamily.poppins, color: AppColors.black32),
                ),
              ),
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => otpTextField(index)),
              ),
              Gap(48.h),
              PrimaryButton(
                  onpress: () {
                    verifyCode();
                    AppNavigator.pushNamed(context, RoutesName.agrementRoute);
                  },
                  text: AppConsts.varify),
              Gap(48.h),
              GestureDetector(
                onTap: () {},
                child: Text(
                  AppConsts.resendCode,
                  style: AppTextStyles.text18.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.pramiry80, fontFamily: AppFontFamily.poppins),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
