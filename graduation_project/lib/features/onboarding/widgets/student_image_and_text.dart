import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart';

class StudentImageAndText extends StatelessWidget {
  const StudentImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/lms_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.12, 0.4],
            ),
          ),
          child: Image.asset('assets/images/onboarding_screen.png'),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(' Empowering Learning\nSimplifying Success',
              textAlign: TextAlign.center,
              style: TextStyles.font34greenBold.copyWith(height: 1.4)),
        ),
      ],
    );
  }
}
