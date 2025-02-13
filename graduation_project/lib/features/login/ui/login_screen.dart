import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/theming/styles.dart';
import 'package:graduation_project/core/widgets/app_text_button.dart';
import 'package:graduation_project/features/login/logic/cubit/login_cubit.dart';
import 'package:graduation_project/features/login/ui/widgets/or_sign_up.dart';
import 'package:graduation_project/features/login/ui/widgets/remember_me_and_forget_password.dart';
import 'package:graduation_project/features/login/ui/widgets/sign_up.dart';

import '../data/models/login_request_body.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
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
                Column(
                  children: [
                    EmailAndPassword(),
                    verticalSpace(30),
                    RememberMeAndForgetPassword(),
                    verticalSpace(30),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WeightMedium,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(30),
                    OrSignUpRow(),
                    verticalSpace(20),
                    SignUp(),
                    LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
            emailOrPhoneNumber: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text,
          ));
    }
  }
}
