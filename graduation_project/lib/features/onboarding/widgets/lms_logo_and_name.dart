import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/theming/styles.dart';

class LmsLogoAndName extends StatelessWidget {
  const LmsLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/logo_lms.svg'),
        SizedBox(width: 10.w),
        Text('PickUp', style: TextStyles.font24BlackBold)
      ],
    );
  }
}
