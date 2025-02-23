import 'package:adv_project/core/networking/api_service.dart';
import 'package:adv_project/core/networking/dio_factory.dart';
import 'package:adv_project/features/home/data/apis/home_api_service.dart';
import 'package:adv_project/features/home/data/repos/home_repo.dart';
import 'package:adv_project/features/login/data/repos/login_repo.dart';
import 'package:adv_project/features/login/logic/cubit/login_cubit.dart';
import 'package:adv_project/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:adv_project/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //registerFactory كل ماحتاج الحاجه دي اعملي منه نسخه
  // ال cubit بالذات يا نونو

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
