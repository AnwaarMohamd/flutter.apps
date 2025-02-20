import 'package:adv_project/core/helpers/spacing.dart';
import 'package:adv_project/core/theming/colors.dart';
import 'package:adv_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 28.0,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/general_speciality.svg',
                      height: 40.h,
                      width: 40.w,
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    'Cardiologist',
                    style: TextStyles.font12DarkBlueRegular,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
