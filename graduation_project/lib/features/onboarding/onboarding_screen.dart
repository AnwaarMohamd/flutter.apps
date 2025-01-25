import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/onboarding/widgets/get_started_bottom.dart';
import 'package:graduation_project/features/onboarding/widgets/lms_logo_and_name.dart';
import '../../core/theming/styles.dart';
import 'widgets/student_image_and_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h // h يعني بتخلي ال30 دي نسبيه على حسب نوع الفون
              ),
          child: Column(
            children: [
              LmsLogoAndName(),
              SizedBox(
                height: 30.h,
              ),
              const StudentImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    Text(
                      'Welcome to LMS App wish you a great learning experience\nNo place for the idle!',
                      style: TextStyles.font12GreyRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h),
                    const GetStartedBotton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
