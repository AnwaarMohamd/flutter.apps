import 'package:graduation_project/core/helpers/jwt_manager.dart';
import 'package:graduation_project/core/networking/api_error_handler.dart';
import 'package:graduation_project/core/networking/api_result.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/features/login/data/models/login_request_body.dart';
import 'package:graduation_project/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);

      if (response.userData?.jwt != null) {
        JwtModel jwtModel = JwtManager.getJwtModel(response.userData!.jwt!);
        JwtManager.setJwtModel(jwtModel);
      }

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
