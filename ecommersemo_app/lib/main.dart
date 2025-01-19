// import 'package:ecommerceui/listgenerate.dart';
// import 'package:ecommerceui/pageone.dart';
// import 'package:ecommerceui/pagetwo.dart';
// import 'package:flutter/material.dart';
// // import 'package:ecommerceui/homepage.dart';



// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   State<MyApp> createState() => MyAppState();
// }

// class MyAppState extends State<MyApp> {
//   GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,   
//       home: const Listgenerate(),
//       routes: {
        
//         "homepage":(context)=> const Listgenerate(),
//         "pageone":(context)=> const Pageone(),
//         "pagetwo":(context)=> Pagetwo(),

//       },
//     );
//   }
// }
import 'package:ecommersemo_app/homepage.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,   
      home: Homepage(),
    );
  }
}