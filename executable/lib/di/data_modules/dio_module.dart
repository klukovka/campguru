import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  @test
  @dev
  Dio dio(
      //TODO: Add auth interceptor
      ) {
    return Dio()
      ..options.baseUrl = 'http://localhost:8087'
      ..options.sendTimeout = const Duration(milliseconds: 180000)
      ..options.receiveTimeout = const Duration(milliseconds: 180000)
      ..options.receiveDataWhenStatusError = true
      ..options.contentType = Headers.jsonContentType
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
        ),
      )
      ..options.validateStatus = (status) => true;
  }

  @lazySingleton
  @prod
  Dio prodDio(
      //TODO: Add auth interceptor
      ) {
    return Dio()
      ..options.baseUrl = 'http://localhost:8087'
      ..options.sendTimeout = const Duration(milliseconds: 180000)
      ..options.receiveTimeout = const Duration(milliseconds: 180000)
      ..options.receiveDataWhenStatusError = true
      ..options.contentType = Headers.jsonContentType
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
        ),
      )
      ..options.validateStatus = (status) => true;
  }
}
