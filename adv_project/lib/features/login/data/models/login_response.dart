import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  int? code;
  bool? status;
  LoginResponse({this.message, this.userData, this.code, this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.token, this.userName});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
