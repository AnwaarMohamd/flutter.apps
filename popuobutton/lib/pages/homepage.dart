import 'package:flutter/material.dart';
import 'package:popuobutton/pages/add_product.dart';
import 'package:popuobutton/pages/products_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Shop",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink[800],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddProduct,
        label: Text("Add Product"),
      ),
      body: ProductsPage(),
    );
  }

  void navigateToAddProduct() {
    final route = MaterialPageRoute(
      builder: (context) => const AddProduct(),
    );
    Navigator.push(context, route);
  }
}
