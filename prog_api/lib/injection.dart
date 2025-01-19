import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prog_api/cubit/my_cubit.dart';
import 'package:prog_api/my_repo.dart';
import 'package:prog_api/web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  // dependancy injection
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetUpDio()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(
        seconds:
            5) //يحدد هذا السطر المهلة الزمنية القصوى (timeout) لمحاولة الاتصال بالخادم
    ..options.receiveTimeout = const Duration(seconds: 5);
  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true));
  return dio;
  // بتشوف كللللل حاجه فال DEBUG CONSOLE
}
