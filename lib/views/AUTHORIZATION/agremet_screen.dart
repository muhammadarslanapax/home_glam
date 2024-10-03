import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/const/consts.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_navigator.dart';
import 'package:home_glam/utils/app_styles.dart';
import 'package:home_glam/widgets/button.dart';
import 'package:home_glam/widgets/custom_check_box.dart';
import 'package:home_glam/widgets/main_app_bar.dart';

class AgrementScreen extends StatefulWidget {
  const AgrementScreen({super.key});

  @override
  State<AgrementScreen> createState() => _AgrementScreenState();
}

class _AgrementScreenState extends State<AgrementScreen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
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
          AppConsts.agreement,
          style: AppTextStyles.text24.copyWith(fontWeight: FontWeight.w500, fontFamily: AppFontFamily.poppins),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(24.0.w),
        child: Column(
          children: [
            Gap(12.h),
            Text(
              AppConsts.dummyData,
              style: AppTextStyles.text16
                  .copyWith(fontWeight: FontWeight.w400, fontFamily: AppFontFamily.roboto, color: AppColors.black1A),
            ),
            Gap(24.h),
            CustomCheckBox(
              isCheck: _isChecked,
              text: AppConsts.iAgree,
              onChanged: (bool value) {
                setState(() {
                  _isChecked = value;
                });
              },
            ),
            Gap(36.h),
            if (_isChecked) ...[
              Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryButton(height: 46, radius: 24.w, width: 138.w, text: AppConsts.next, onpress: () {}))
            ]
          ],
        ),
      ),
    );
  }
}
