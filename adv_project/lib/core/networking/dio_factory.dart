import 'package:dio/dio.dart'; // Assuming "diofilm.dmrt" refers to Dio
import 'package:pretty_dio_logger/pretty_dio_logger.dart'; // Assuming "preity_dib_logger.dmrt" refers to PrettyDioLogger

class DioFactory {
  // Private constructor to prevent instantiation
  DioFactory._();

  // Static instance of Dio for API calls
  static Dio? dio;

  // Method to initialize and get Dio instance
  static Dio getDio() {
    Duration timeout = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();

      // Set timeout options
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;

      // Add interceptors
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  // Method to add addDioInterceptor
  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
}
