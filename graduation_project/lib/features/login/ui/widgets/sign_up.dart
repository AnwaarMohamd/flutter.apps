import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 12, color: Color(0xFF242424)),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.signUpScreen);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF247CFF),
            ),
          ),
        ),
      ],
    );
  }
}
