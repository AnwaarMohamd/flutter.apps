import 'package:flutter/material.dart';
import 'package:graduation_project/core/di/dependency_injection.dart';
import 'package:graduation_project/core/routing/app_router.dart';
import 'package:graduation_project/lms_app.dart';

void main() {
  setupGetIt();
  runApp(LmsApp(
    appRouter: AppRouter(),
  ));
}
