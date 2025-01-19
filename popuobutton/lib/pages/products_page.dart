import 'package:flutter/material.dart';
import 'package:popuobutton/services/product_service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List products = [];
  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        String imageUrl = "";
        if (product['image'].isEmpty) {
          imageUrl = 'https://dummyimage.com/600x400/000/fff';
        } else {
          imageUrl = product['image'][0]['src'];
        }
        return Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              )),
            )),
            Text("\$${product['price']}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(
              "${product['name']}", // Fix: Now displays the product name
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 80, height: 25),
                  child: ElevatedButton(
                    onPressed: () =>
                        navigateToEditProduct(product), // Edit product logic
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.all(2)),
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 80, height: 25),
                  child: ElevatedButton(
                    onPressed: () =>
                        deleteProducts(product['id']), // Delete logic
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.all(2)),
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> getAllProducts() async {
    final response = await ProductService.getAllProducts();
    if (response != null) {
      setState(() {
        products = response;
      });
    } else {
      print('Response : $response');
    }
  }

  void navigateToEditProduct(product) {
    print("edit");
  }

  Future<void> deleteProducts(int productId) async {
    print("delete");
  }
}
