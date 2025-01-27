import 'package:adv_project/core/theming/colors.dart';
import 'package:adv_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    BorderSide(color: ColorsManager.mainBlue, width: 1.3),
                borderRadius: BorderRadius.circular(16),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsManager.lightGray,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
          hintStyle: hintStyle ?? TextStyles.font14LightGreyregular,
          hintText: hintText,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: backgroundColor ?? ColorsManager.moreLightGray),
      obscureText: isObscureText ?? false, // show ***
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
