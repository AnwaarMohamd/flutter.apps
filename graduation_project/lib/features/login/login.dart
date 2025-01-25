import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/styles.dart';

import '../../core/theming/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),

              Text(
                'Welcome Back',
                style: TextStyles.font24lightGreen,
              ),
              SizedBox(height: 20), // مسافة رأسية بين النصوص
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14Grey,
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  // border: InputBorder.none, // Remove border
                  filled: true, // Enable filling the background color
                  fillColor:
                      const Color(0xFFFDFDFF), // Background color of the input
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16, // Vertical padding
                    horizontal: 16, // Horizontal padding
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Rounded corners
                    borderSide: BorderSide(
                        color: Color(0xFFEDEDED)), // Invisible border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Rounded corners
                    borderSide: BorderSide(
                        color: Color(0xFFEDEDED)), // Invisible border
                  ),
                ),
              ),
              SizedBox(height: 20), // Space between the text fields
              // Second TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  // border: InputBorder.none, // Remove border
                  filled: true, // Enable filling the background color
                  fillColor:
                      const Color(0xFFFDFDFF), // Background color of the input
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16, // Vertical padding
                    horizontal: 16, // Horizontal padding
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Rounded corners
                    borderSide: BorderSide(
                        color: Color(0xFFEDEDED)), // Invisible border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Rounded corners
                    borderSide: BorderSide(
                        color: Color(0xFFEDEDED)), // Invisible border
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
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
                    style: TextStyle(fontSize: 13, color: Color(0xFFA9B2B9)),
                  ),
                  Spacer(),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 12, color: Color(0xFF247CFF)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: TextButton(
                    onPressed: () {
                      // context.pushNamed(Routes.loginScreen);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorsManager.lightGreen),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: WidgetStatePropertyAll(
                          const Size(double.infinity, 52),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: Text(
                      'Login',
                      style: TextStyles.font16WeightSemiBold,
                    )),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey, // لون الخط
                      thickness: 1, // سماكة الخط
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or sign in with',
                      style: TextStyle(
                        color: Colors.grey, // لون النص
                        fontSize: 14, // حجم النص
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey, // لون الخط
                      thickness: 1, // سماكة الخط
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have ansS account?",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
