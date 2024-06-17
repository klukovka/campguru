import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  // String get baseUrl => 'http://192.168.0.145:8087';
  String get baseUrl => 'http://localhost:8087';
  @lazySingleton
  AuthInterceptor authInterceptor(
    PreferencesRepository preferencesRepository,
  ) =>
      AuthInterceptor(preferencesRepository);

  @lazySingleton
  @test
  @dev
  Dio dio(AuthInterceptor authInterceptor, String baseUrl) {
    return Dio()
      ..options.baseUrl = baseUrl
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
      ..interceptors.add(authInterceptor)
      ..options.validateStatus = (status) => true;
  }

  @lazySingleton
  @prod
  Dio prodDio(AuthInterceptor authInterceptor, String baseUrl) {
    return Dio()
      ..options.baseUrl = baseUrl
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
      ..interceptors.add(authInterceptor)
      ..options.validateStatus = (status) => true;
  }
}
