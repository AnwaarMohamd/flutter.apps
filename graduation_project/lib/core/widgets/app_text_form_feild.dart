import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;

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
    this.controller,
    required this.validator,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true, //add padding
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsManager.mainGreen, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.lightgray,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: widget.hintStyle ?? TextStyles.font14DarkGreyregular,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: widget.backgroundColor ?? ColorsManager.moreLightGray,
      ),
      obscureText:
          widget.isObscureText ?? false, // show *** when u write password
      style: TextStyles.font14DarkGreyregular,
      validator: (value) {
        return widget
            .validator(value); //return error message Mosh zay ma omar 3mlhhha
      },
    );
  }
}
