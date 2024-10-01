import 'package:flutter/material.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color? color;
  final double? radius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  const Button({
    super.key,
    required this.text,
    this.press,
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 12)),
            fixedSize: Size(width ?? widhtsize, height ?? 46)),
        onPressed: press,
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.text16.copyWith(fontWeight: FontWeight.w500, color: AppColors.white),
        ));
  }
}
