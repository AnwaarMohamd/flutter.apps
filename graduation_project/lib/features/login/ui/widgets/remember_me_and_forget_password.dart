import 'package:flutter/material.dart';
import 'package:graduation_project/core/theming/colors.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  _RememberMeAndForgetPasswordState createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text(
          'Remember me',
          style: TextStyle(fontSize: 13, color: ColorsManager.darkGray),
        ),
        Spacer(),
        Text(
          'Forgot Password?',
          style: TextStyle(fontSize: 12, color: Color(0xFF247CFF)),
        ),
      ],
    );
  }
}
