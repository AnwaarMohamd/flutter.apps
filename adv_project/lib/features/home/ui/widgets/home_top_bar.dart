import 'package:adv_project/core/theming/colors.dart';
import 'package:adv_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Anwaar",
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              "How Are you Today?",
              style: TextStyles.font12GreyRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighertGray,
          child: SvgPicture.asset('assets/svgs/notifications.svg'),
        ),
      ],
    );
  }
}
