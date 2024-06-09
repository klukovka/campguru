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
    return await apiAuthRepository.refreshToken(refreshToken);
  }

  @override
  Future<FailureOrResult<AuthenticationDetails>> signUp(NewUser newUser) async {
    return await apiAuthRepository.signUp(newUser);
  }

  @override
  Future<FailureOrResult<AuthenticationDetails>> login(
    LoginUser loginUser,
  ) async {
    return await apiAuthRepository.login(loginUser);
  }

  @override
  Future<FailureOrResult<void>> resetPassword(String email) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiAuthRepository.resetPassword(email),
      testRequest: () async => await testAuthRepository.resetPassword(email),
    );
  }

  @override
  Future<FailureOrResult<void>> changePassword(
      PatchPassword patchPassword) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiAuthRepository.changePassword(patchPassword),
      testRequest: () async =>
          await testAuthRepository.changePassword(patchPassword),
    );
  }
}
