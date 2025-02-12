import 'package:adv_project/core/helpers/extensions.dart';
import 'package:adv_project/core/routing/routes.dart';
import 'package:adv_project/core/theming/colors.dart';
import 'package:adv_project/core/theming/styles.dart';
import 'package:adv_project/features/login/logic/cubit/login_cubit.dart';
import 'package:adv_project/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
              context: context,
              builder: (context) => const Center(
                      child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue,
                  )));
        }, success: (loadingResponse) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        }, error: (error) {
          setupErrorState(context, error);
        });
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Get It',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
