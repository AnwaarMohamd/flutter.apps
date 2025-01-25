import 'package:adv_project/core/helpers/extensions.dart';
import 'package:adv_project/core/routing/routes.dart';
import 'package:adv_project/core/theming/colors.dart';
import 'package:adv_project/core/theming/styles.dart';
import 'package:flutter/material.dart';

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
                  MaterialStateProperty.all(ColorsManager.mainBlue),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: WidgetStatePropertyAll(
                const Size(double.infinity, 52),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
          child: Text(
            'Get Started',
            style: TextStyles.font16WeightSemiBold,
          )),
    );
  }
}
