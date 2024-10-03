
import 'package:flutter/material.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/app_styles.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isCheck;
  final String text;
  final ValueChanged<bool> onChanged;

  const CustomCheckBox({
    super.key,
    required this.isCheck,
    required this.text,
    required this.onChanged,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isCheck;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: AppColors.pramiry,
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
            widget.onChanged(_isChecked);
          },
        ),
        Flexible(
          child: Text(
            widget.text,
            maxLines: 2,
            style: AppTextStyles.text14.copyWith(
              fontWeight: FontWeight.w400,
              fontFamily: AppFontFamily.poppins,
              color: AppColors.black32,
            ),
          ),
        )
      ],
    );
  }
}
