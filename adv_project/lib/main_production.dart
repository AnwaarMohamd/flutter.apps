import 'package:adv_project/core/di/dependency_injection.dart';
import 'package:adv_project/core/routing/app_router.dart';
import 'package:adv_project/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  // to fix texts being hidden bug in flutter_screenUtil in release ode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
