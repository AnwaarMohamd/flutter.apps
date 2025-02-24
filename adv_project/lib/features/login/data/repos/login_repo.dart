import 'package:adv_project/core/networking/api_error_handler.dart';
import 'package:adv_project/core/networking/api_result.dart';
import 'package:adv_project/core/networking/api_service.dart';
import 'package:adv_project/features/login/data/models/login_request_body.dart';
import 'package:adv_project/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
