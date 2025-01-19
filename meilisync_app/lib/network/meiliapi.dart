import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meilisync_app/model/meilimodel.dart';

class API {
  static const String _Base_URL =
      'https://meilisync.runasp.net/meilisync/api/v1/meilisearch';

  // طريقة لجلب جميع العناصر
  static Future<List<Item>> getMilly(int page, int limit) async {
    final response = await http.get(
      Uri.parse(
          '$_Base_URL/paginate?pageNumber=$page&pageSize=$limit&orderBeforPagination=true'), // رابط API لجلب العناصر
    );

    if (response.statusCode == 200) {
      // فك البيانات المستلمة وتحويلها إلى قائمة من العناصر
      final jsonResponse = json.decode(response.body);
      final meiliSearch = MeiliSearch.fromJson(jsonResponse);
      return meiliSearch.items;
    } else {
      throw Exception("Failed to get data");
    }
  }

  // طريقة لحذف عنصر بناءً على ID
  static Future<http.Response> deleteMilly(String id) async {
    final response = await http.delete(Uri.parse('$_Base_URL?id=$id'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to remove element");
    }
  }

  static Future<Item> createMilly(Item data) async {
    // منطق إرسال البيانات إلى الخادم
    final response = await http.post(
      Uri.parse(_Base_URL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      // تحويل البيانات المستقبلة إلى كائن object
      return Item.fromJson(json.decode(response.body));
    } else {
      // print("error");
      throw Exception("can not load info");
    }
  }

  static Future<http.Response> editMilly(Item data) async {
    final response = await http.put(
      Uri.parse(_Base_URL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      // تحويل البيانات المستقبلة إلى كائن object
      // return DataSearch.fromJson(json.decode(response.body));
      return response;
    } else {
      // print("error");
      throw Exception("can not load info");
    }
  }

  static Future<MeiliSearch> getMillyById(String id) async {
    // Logic to send a request to the server
    final response = await http.get(
      Uri.parse('$_Base_URL?id=$id'),
    );

    if (response.statusCode == 200) {
      // Convert the received data into a DataSearch object
      return MeiliSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot load info");
    }
  }
}
