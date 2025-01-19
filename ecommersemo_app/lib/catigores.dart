import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});



  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List items =[
{"image":"https://media.gemini.media/img/yallakora/Normal//2023/2/16/6-22023_2_16_13_1.jpg",
 "title" :"Electronics"},
 {"image":"https://media.gemini.media/img/yallakora/Normal//2023/2/16/6-22023_2_16_13_1.jpg",
 "title" :"Musics"},
 {"image":"https://media.gemini.media/img/yallakora/Normal//2023/2/16/6-22023_2_16_13_1.jpg",
 "title" :"Fashion"},
 {"image":"https://media.gemini.media/img/yallakora/Normal//2023/2/16/6-22023_2_16_13_1.jpg",
 "title" :"Degital Service"},
 {"image":"https://media.gemini.media/img/yallakora/Normal//2023/2/16/6-22023_2_16_13_1.jpg",
 "title" :"Sports"},
 {"image":"https://media.gemini.media/img/yallakora/Normal//2023/2/16/6-22023_2_16_13_1.jpg",
 "title" :"Magic"},

  ];
  int selectedindex = 0;
  
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
       BottomNavigationBar(

          selectedItemColor: Colors.yellow,
          backgroundColor: const Color.fromARGB(31, 239, 229, 229),
        
        onTap: (value) {
              setState(() {
                selectedindex = value;
              });
            },
            currentIndex: selectedindex,
        iconSize: 30, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined , color: Colors.grey[600],), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.search_outlined ,color: Colors.grey[600],), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_outlined , color: Colors.grey[600],), label: ""),
         BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined , color: Colors.grey[600]), label: "" ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded , color: Colors.grey[600]), label: "",
            ),
      ]),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(child: 
                TextFormField(
                  
                  decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search_outlined),
                    border: OutlineInputBorder(borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  fillColor: Color.fromARGB(31, 239, 229, 229),
                  filled: true,
                    
                  ),
                  





                )
                ,),
              ],
            )
          ],
        ),




      ),



    );
  }
}