// import 'package:ecommerceui/details.dart';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Hello,',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Text(
              'Hari Prasad',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ]),
          Container(
            width: 57,
            height: 57,
            decoration: BoxDecoration(
                color: const Color.fromARGB(31, 239, 229, 229),
                borderRadius: BorderRadius.circular(300)),
            child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.white),
                onPressed: () {}),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.yellow,
          backgroundColor: const Color.fromARGB(31, 239, 229, 229),
          onTap: (value) {
            // NavigationBar(destinations: Navigaator);
            setState(() {
              selectedindex = value;
            });
          },
          currentIndex: selectedindex,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey[600],
                ),
                label: ""),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.grey[600],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.grey[600],
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined,
                    color: Colors.grey[600]),
                label: ""),
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.person_outline_rounded, color: Colors.grey[600]),
                label: ""),
          ]),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    decoration: const InputDecoration(
                      focusColor: Colors.amber,
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    
                  ),
                  suffixIcon: Icon(
                    Icons.keyboard_voice_outlined,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 20),
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  fillColor: Color.fromARGB(31, 239, 229, 229),
                  filled: true,
                )),
              ),
            ],
          ),

          //  Image.asset('images/popy/1.png'),
        ]),
      ),
    );
  }
}
