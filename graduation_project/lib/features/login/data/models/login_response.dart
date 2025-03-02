import 'package:graduation_project/core/helpers/jwt_manager.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  int? statusCode;
  bool? success;
  @JsonKey(name: 'result')
  UserData? userData;

  JwtModel? jwtModel; // إضافة كائن JWT Model

  LoginResponse({this.message, this.userData, this.statusCode, this.success}) {
    if (userData?.jwt != null) {
      jwtModel = JwtManager.getJwtModel(userData!.jwt!);
    }
  }
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? jwt;
  String? refreshToken;
  UserData({this.jwt, this.refreshToken});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
