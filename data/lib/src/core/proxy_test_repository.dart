import 'package:domain/domain.dart';

abstract class ProxyTestRepository {
  Future<FailureOrResult<T>> makeSafeRequest<T>({
    required Future<FailureOrResult<T>> Function() apiRequest,
    required Future<FailureOrResult<T>> Function() testRequest,
  }) async {
    try {
      return await apiRequest();
    } catch (_) {
      return await testRequest();
    }
  }

  Future<T> makeAsyncCall<T>({
    required Future<T> Function() apiRequest,
    required Future<T> Function() testRequest,
  }) async {
    try {
      return await apiRequest();
    } catch (_) {
      return await testRequest();
    }
  }

  T makeSafeCall<T>({
    required T Function() apiRequest,
    required T Function() testRequest,
  }) {
    try {
      return apiRequest();
    } catch (_) {
      return testRequest();
    }
  }
}
