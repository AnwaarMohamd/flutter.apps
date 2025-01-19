import 'package:flutter/material.dart';
import 'package:meilisync_app/ui/meilipage.dart';
import 'package:meilisync_app/ui/sourcepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _onItemTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Meillipage()));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Sourcepage()));
    }
  }

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[600],
        selectedFontSize: 16,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.speed_rounded), label: "Meile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.donut_large_sharp), label: "Source"),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: "Sync"),
        ],
        currentIndex: selectedindex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[600],
      ),
    );
  }
}
