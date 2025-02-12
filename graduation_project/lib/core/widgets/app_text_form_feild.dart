import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  const AppTextFormField({
    super.key,
    this.backgroundColor,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.inputTextStyle,
    this.isObscureText,
    this.suffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          isDense: true, //add padding
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsManager.mainGreen, width: 1.3),
                borderRadius: BorderRadius.circular(16),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.lightgray,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
          hintStyle: hintStyle ?? TextStyles.font14DarkGreyregular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: backgroundColor ?? ColorsManager.moreLightGray),
      obscureText: isObscureText ?? false, // show *** when u write password
      style: TextStyles.font14DarkGreyregular,
    );
  }
}
