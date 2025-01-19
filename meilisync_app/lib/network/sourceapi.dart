import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meilisync_app/model/sourcemodel.dart';

class API {
  static const String _Base_URL =
      'https://meilisync.runasp.net/meilisync/api/v1/source';

  // طريقة لجلب جميع العناصر
  static Future<List<Itemsource>> getSource(int page, int limit) async {
    final response = await http.get(Uri.parse(
        '$_Base_URL/paginate?pageNumber=$page&pageSize=$limit&orderBeforPagination=true'));
    
    
    if (response.statusCode == 200) {
      // فك البيانات المستلمة وتحويلها إلى قائمة من العناصر
      final jsonResponse = json.decode(response.body);
      final sourceMeile = SourcePage.fromJson(jsonResponse);
      return sourceMeile.items;
    } else {
      throw Exception("Failed to get data");
    }
  }

  // طريقة لحذف عنصر بناءً على ID
  static Future<http.Response> deleteSource(String id) async {
    final response = await http.delete(Uri.parse('$_Base_URL?id=$id'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception("Failed to remove element");
    }
  }

  static Future<Itemsource> createSource(Itemsource data) async {
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
      return Itemsource.fromJson(json.decode(response.body));
    } else {
      // print("error");
      throw Exception("can not load info");
    }
  }

  static Future<http.Response> editSource(Itemsource data) async {
    final response = await http.put(
      Uri.parse(_Base_URL),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      // تحويل البيانات المستقبلة إلى كائن object
      return response;
    } else {
      throw Exception("can not load info");
    }
  }

  static Future<SourcePage> getSourceById(String id) async {
    // Logic to send a request to the server
    final response = await http.get(
      Uri.parse('$_Base_URL?id=$id'),
    );

    if (response.statusCode == 200) {
      // Convert the received data into a DataSearch object
      return SourcePage.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot load info");
    }
  }
}
