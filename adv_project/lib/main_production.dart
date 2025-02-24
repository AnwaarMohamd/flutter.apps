import 'package:adv_project/core/di/dependency_injection.dart';
import 'package:adv_project/core/helpers/constants.dart';
import 'package:adv_project/core/helpers/extensions.dart';
import 'package:adv_project/core/helpers/shared_pref_helper.dart';
import 'package:adv_project/core/routing/app_router.dart';
import 'package:adv_project/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // to fix texts being hidden bug in flutter_screenUtil in release ode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
