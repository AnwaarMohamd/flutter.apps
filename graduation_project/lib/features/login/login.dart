import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/styles.dart';
import 'package:graduation_project/core/widgets/app_text_button.dart';
import 'package:graduation_project/core/widgets/app_text_form_feild.dart';

import '../../core/theming/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  final formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24lightGreen,
                ),
                verticalSpace(20),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14darkGrey,
                ),
                verticalSpace(40),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpace(20),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          child: Icon(isObsecureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      verticalSpace(30),
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
                            style: TextStyle(
                                fontSize: 13, color: ColorsManager.darkGray),
                          ),
                          Spacer(),
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF247CFF)),
                          ),
                        ],
                      ),
                      verticalSpace(30),
                      AppTextButton(
                          buttonText: "Login",
                          textStyle: TextStyles.font16WeightMedium,
                          onPressed: () {}),
                      verticalSpace(15),
                    ],
                  ),
                ),
                verticalSpace(30),
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
                verticalSpace(30),
                Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
