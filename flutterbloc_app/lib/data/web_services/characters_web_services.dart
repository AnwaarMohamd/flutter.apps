import 'package:dio/dio.dart';
import 'package:flutterbloc_app/constants/strings.dart';
import 'package:flutterbloc_app/data/models/characters.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 20 * 1000), // 20 ثانية
      receiveTimeout: const Duration(milliseconds: 20 * 1000), // 20 ثانية
    );

    dio = Dio(options); // باصينا ال options ل dio
  }

  Future<List<Character>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
