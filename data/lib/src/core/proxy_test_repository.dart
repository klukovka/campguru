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
}
