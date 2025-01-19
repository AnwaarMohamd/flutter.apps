import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_api/cubit/my_cubit.dart';
import 'package:prog_api/home_screen.dart';
import 'package:prog_api/injection.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<MyCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}
