import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const ItemsDetails({super.key, this.data});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(iconSize: 30, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "*"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: "*"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: "*"),
      ]),
      endDrawer: const Drawer(),
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopify_sharp),
            Text(" Purchase",
                style: TextStyle(
                    color: Colors.grey[850], fontWeight: FontWeight.bold)),
            const Text("Page",
                style: TextStyle(
                    color: Color.fromARGB(255, 192, 97, 15),
                    fontWeight: FontWeight.w500)),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 216, 216, 216),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Image.network(widget.data['image']),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                widget.data['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(widget.data['price'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 25),
              child: Text(widget.data['subtitle'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Color :",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 5),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 208, 2)),
                  )),
              Text("Grey",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 5),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 208, 2)),
                  )),
              Text("Black",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 25, bottom: 30),
            child: Text("Size :     34   36   38   40",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700])),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              height: 50,
              child: MaterialButton(
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.black,
                  onPressed: () {}))
        ],
      ),
    );
  }
}
