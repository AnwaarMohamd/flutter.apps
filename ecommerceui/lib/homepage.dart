import 'package:ecommerceui/details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List catigories = [
    {"iconname": Icons.laptop, "title": "LapTop"},
    {"iconname": Icons.phone_android_outlined, "title": "Mobile"},
    {"iconname": Icons.electric_bike, "title": "Bike"},
    {"iconname": Icons.electric_car_outlined, "title": "Cars"},
    {"iconname": Icons.card_giftcard_outlined, "title": "Gifts"},
    {"iconname": Icons.rate_review, "title": "Rate"},
  ];
  List items = [
    {
      "image":
          "https://media.gemini.media/img/yallakora/Normal//2023/2/16/6-22023_2_16_13_1.jpg",
      "title": "Sony XM5",
      "price": "\$500",
      "subtitle": "15% Off"
    },
    {
      "image":
          "https://zasshope.com/cdn/shop/articles/0cf329370b964f7a0e4637f801936581_1200x1200.jpg?v=1709862151",
      "title": "LapTop Apple",
      "price": "\$3500",
      "subtitle": "Sold Out"
    },
    {
      "image":
          "https://vid.alarabiya.net/images/2023/09/24/e18ac9a5-4346-4c4e-8079-a241ecb8fc82/e18ac9a5-4346-4c4e-8079-a241ecb8fc82.jpg?crop=4:3&width=1200",
      "title": "Iphone 15 pro",
      "price": "\$350",
      "subtitle": "Used"
    },
    {
      "image":
          "https://timgm.eprice.com.tw/tw/mobile/img/2023-01/31/5769927/eprice_1_143bbc11a3a55bb5a702e146e688f881.jpg",
      "title": "Galaxy s23",
      "price": "\$200",
      "subtitle": "New"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5WdYWvjE8LZkC2NQl0rBtgPRFnEvRKTWgVlZ7BJngQzOnLwebDaqdd7kkk0PSW601W6I&usqp=CAU",
      "title": "ٍSamsung Screen",
      "price": "\$3000",
      "subtitle": "20% Off"
    },
  ];
  int selectedbar = 0;

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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "search",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  fillColor: Color.fromARGB(255, 210, 210, 210),
                  filled: true,
                ),
              )),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.menu,
                  size: 30,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              "Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            height: 100,
            child: ListView.builder(
                itemCount: catigories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 212, 212, 212),
                              borderRadius: BorderRadius.circular(40)),
                          child: Icon(
                            catigories[i]['iconname'],
                            size: 30,
                          ),
                        ),
                        Text(
                          catigories[i]['title'],
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(169, 45, 44, 44)),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Best Selling",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
              itemCount: items.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ItemsDetails(
                                data: items[i],
                              )));
                    },
                    child: Card(
                      child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 42, 42, 42),
                              child: Image.network(
                                items[i]['image'],
                                width: 169,
                                height: 95,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 5,
                            ),
                            Text(items[i]['title'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                            Container(
                              height: 3,
                            ),
                            Text(items[i]['price'],
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 15)),
                            Text(items[i]['subtitle'],
                                style: TextStyle(
                                    color: Colors.yellow[900],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900)),
                          ]),
                    ));
              })
        ]),
      ),
    );
  }
}
