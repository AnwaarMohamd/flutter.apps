import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';

import '../../../core/theming/styles.dart';

class GetStartedBotton extends StatelessWidget {
  const GetStartedBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: TextButton(
          onPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorsManager.mainGreenDark),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: WidgetStatePropertyAll(
                const Size(double.infinity, 52),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ))),
          child: Text(
            'Get Started',
            style: TextStyles.font16WeightMedium,
          )),
    );
  }
}
