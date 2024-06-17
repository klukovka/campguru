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

    return handleError<T>();
  }

  FailureOrResult<List<T>> toFailureOrResultList<T>(
    Dto<T>? Function(Map<String, dynamic> json) parse, [
    int successCode = 200,
  ]) {
    if (statusCode == successCode) {
      if (data is List<dynamic>) {
        return FailureOrResult.success(data.map((e) => parse(e)!.toDomain()));
      }
      return FailureOrResult.success(null);
    }

    return handleError<List<T>>();
  }

  FailureOrResult<T> handleError<T>() {
    try {
      final result = data is String ? jsonDecode(data) : data;
      final response = ErrorDto.fromJson(result);

      return FailureOrResult.failure(
        ApiFailure(
          code: statusCode.toString(),
          message: response.message ?? statusMessage ?? '',
        ),
      );
    } catch (e) {
      return FailureOrResult.failure(ApplicationFailure(
        type: ApplicationErrorType.general,
      ));
    }
  }
}
