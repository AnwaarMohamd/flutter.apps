// import 'package:flutter/material.dart';

// class Pagetwo extends StatefulWidget {
//   const Pagetwo({super.key});

//   @override
//   State<Pagetwo> createState() => _PagetwoState();
// }

// class _PagetwoState extends State<Pagetwo> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     print("page TTTTTTTTTTow");
//     super.initState();
//   }
//   void dispose() {
//     // TODO: implement initState
//     print("page TTTTTTTTTTow 5555");
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       appBar: AppBar(title: const Text("Page two"),backgroundColor: Colors.blue[700],),
//       body: ListView(
//         children: [
//           MaterialButton(
//             onPressed: (){
//               Navigator.of(context).pushNamedAndRemoveUntil("homepage" , (route) => false);
//             },
//             child: Text("Move to Homepage"),
//             ),
            
//           MaterialButton(
//             onPressed: (){
//               Navigator.of(context).pushNamed("pageone");
//             },
//             child: Text("Move to page 1"),
//             ),

         
//         ],
//     ));
// }
// }