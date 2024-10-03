
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_styles.dart';

class PrimaryTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hint;
  final int? maxLines;
  final bool? obscure;
  final TextInputAction? textInputAction;

  const PrimaryTextField({
    super.key,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.hint,
    this.maxLines,
    this.obscure,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: AppTextStyles.text14.copyWith(fontFamily: AppFontFamily.poppins, color: AppColors.black32),
        ),
        Gap(8.h),
        TextFormField(
          textInputAction: textInputAction,
          validator: validator,
          obscureText: obscure ?? false,
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(color: AppColors.pramiry),
          keyboardType: TextInputType.text,
          cursorColor: AppColors.pramiry,
          onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.pramiryF1,
            border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ],
    );
  }
}
