import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_glam/const/consts.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_styles.dart';

Widget buildDivider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 24.h),
    child: Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            AppConsts.or,
            style: AppTextStyles.text20
                .copyWith(fontWeight: FontWeight.w500, color: AppColors.black32, fontFamily: AppFontFamily.poppins),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    ),
  );
}
