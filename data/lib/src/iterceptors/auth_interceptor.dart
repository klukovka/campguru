import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class AuthInterceptor extends Interceptor {
  final PreferencesRepository _preferencesRepository;

  AuthInterceptor(this._preferencesRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = _preferencesRepository.accessToken;
    if (_preferencesRepository.isLoggedIn) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
