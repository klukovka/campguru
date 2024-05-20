import 'dart:convert';

import 'package:data/src/core/dto.dart';
import 'package:data/src/models/errors/error_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

extension HandleResponseExtension on Response {
  FailureOrResult<T> toFailureOrResult<T>(
    Dto<T>? Function(Map<String, dynamic> json) parse, [
    int successCode = 200,
  ]) {
    if (statusCode == successCode) {
      if (data is Map<String, dynamic>) {
        return FailureOrResult.success(parse(data)?.toDomain());
      }
      return FailureOrResult.success(null);
    }

    final response = ErrorDto.fromJson(jsonDecode(data));

    return FailureOrResult.failure(
      ApiFailure(
        code: statusCode.toString(),
        message: response.message ?? statusMessage ?? '',
      ),
    );
  }
}
