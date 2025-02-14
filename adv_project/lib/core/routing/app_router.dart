import 'package:adv_project/core/di/dependency_injection.dart';
import 'package:adv_project/core/routing/routes.dart';
import 'package:adv_project/features/home/ui/home_screen.dart';
import 'package:adv_project/features/login/logic/cubit/login_cubit.dart';
import 'package:adv_project/features/onboarding/onboarding_screen.dart';
import 'package:adv_project/features/login/ui/login_screen.dart';
import 'package:adv_project/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:adv_project/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this (arguments as class name)
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
