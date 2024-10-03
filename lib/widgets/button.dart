import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onpress;
  final Color? color;
  final double? radius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onpress,
    this.color,
    this.radius,
    this.width,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final widhtsize = MediaQuery.of(context).size.width;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.pramiry,
            fixedSize: Size(
              width ?? widhtsize,
              height ?? 56.h,
            ),
            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 12.r)),
            elevation: 1),
        onPressed: () => onpress(),
        child: Text(
          text,
          style: textStyle ??
              AppTextStyles.text16
                  .copyWith(fontFamily: AppFontFamily.poppins, fontWeight: FontWeight.w500, color: AppColors.white),
        ));
  }
}
