import 'package:adv_project/core/di/dependency_injection.dart';
import 'package:adv_project/core/routing/app_router.dart';
import 'package:adv_project/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
