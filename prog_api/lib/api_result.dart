
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:prog_api/network_exception.dart';
import 'package:prog_api/network_exceptions.freezed.dart';

import 'network_exceptions.freezed.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T>{
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(NetworkExceptions networkException) =
  Failure<T>;

}