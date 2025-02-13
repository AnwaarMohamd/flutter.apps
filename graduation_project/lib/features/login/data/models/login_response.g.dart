// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      userData: json['result'] == null
          ? null
          : UserData.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'success': instance.success,
      'result': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      jwt: json['jwt'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'jwt': instance.jwt,
      'refreshToken': instance.refreshToken,
    };
