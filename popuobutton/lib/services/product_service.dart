import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  static const String apiUrl = "https://fakestoreapi.com/products";
  static const String key = "ck_b889a51653d0210c1ac79fee13c99180c5285eea";
  static const String secret = "cs_2d11c2fbeed8e926fab8cdf090e9bbcd774bf8dd";
//ف حالتين عندي ف Git
  //اقدر اسيب الداتا الكل يشوفها هنا مش ببعت header
  //طب لو مش عايز الداتا تظهر غير لشخص اللي عامل تسجيل دخول عندي ف ببعت الداتا  ف. Header بالشكل دا
  static Map<String, String> getHeader() {
    final basicAuth = 'Basic ${base64Encode(utf8.encode('$key:$secret'))}';
    return {'Authorization': basicAuth, 'Content-Type': 'application/json'};
  }

  static Future<List> getAllProducts() async {
    List products = [];
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        products = jsonDecode(response.body);
        print("****");
        print(products);
      } else {
        print('Failed to get products. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
    return products;
  }
}
