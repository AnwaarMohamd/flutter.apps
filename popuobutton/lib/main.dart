// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:popuobutton/pages/homepage.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
