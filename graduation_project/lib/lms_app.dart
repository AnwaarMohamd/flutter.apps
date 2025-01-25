import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/routing/app_router.dart';
import 'package:graduation_project/core/routing/routes.dart';
import 'package:graduation_project/core/theming/colors.dart';

class LmsApp extends StatelessWidget {
  final AppRouter appRouter;
  const LmsApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        // title: 'Lms App',
        // theme: ThemeData(
        //   primaryColor: ColorsManager.mainBlue,
        //   scaffoldBackgroundColor: Colors.white,
        // ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
