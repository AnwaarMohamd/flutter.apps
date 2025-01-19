// import 'package:flutter/material.dart';

// class Pageone extends StatefulWidget {
//   const Pageone({super.key});

//   @override
//   State<Pageone> createState() => _PageoneState();
// }

// class _PageoneState extends State<Pageone> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(title: const Text("Page One"),backgroundColor: Colors.blue[700],),
//       body: ListView(
//         children: [
//           MaterialButton(
//             onPressed: (){
//               Navigator.of(context).pushNamed("homepage");
//             },
//             child: Text("Move to Homepage"),
//             ),
            
//           MaterialButton(
//             onPressed: (){
//               Navigator.of(context).pushNamed("pagetwo");
//             },
//             child: Text("Move to page 2"),
//             ),

         
//         ],
//     ),
//       );
//   }
// }