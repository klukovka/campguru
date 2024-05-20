import 'package:data/data.dart';
import 'package:data/src/core/proxy_test_repository.dart';
import 'package:data/src/repositories/auth_repository/api_auth_repository.dart';
import 'package:data/src/repositories/auth_repository/test_auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ProxyTestAuthRepository extends ProxyTestRepository
    implements AuthRepository {
  final TestAuthRepository testAuthRepository;
  final ApiAuthRepository apiAuthRepository;

  ProxyTestAuthRepository(Dio dio)
      : testAuthRepository = TestAuthRepository(),
        apiAuthRepository = ApiAuthRepository(dio);

  @override
  Future<FailureOrResult<AuthenticationDetails>> refreshToken(
    String refreshToken,
  ) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiAuthRepository.refreshToken(refreshToken),
      testRequest: () async =>
          await testAuthRepository.refreshToken(refreshToken),
    );
  }

  @override
  Future<FailureOrResult<AuthenticationDetails>> signUp(NewUser newUser) async {
    return await apiAuthRepository.signUp(newUser);
  }
}
