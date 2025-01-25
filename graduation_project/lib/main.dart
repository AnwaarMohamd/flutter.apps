import 'package:flutter/material.dart';
import 'package:graduation_project/core/routing/app_router.dart';
import 'package:graduation_project/lms_app.dart';

void main() {
  runApp(LmsApp(
    appRouter: AppRouter(),
  ));
}
