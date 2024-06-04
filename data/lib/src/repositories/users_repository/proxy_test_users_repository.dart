import 'package:data/data.dart';
import 'package:data/src/core/proxy_test_repository.dart';
import 'package:data/src/repositories/users_repository/test_users_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ProxyTestUsersRepository extends ProxyTestRepository
    implements UsersRepository {
  final ApiUsersRepository apiUsersRepository;
  final TestUsersRepository testUsersRepository;

  ProxyTestUsersRepository(TestDataSource dataSource, Dio dio)
      : apiUsersRepository = ApiUsersRepository(dio),
        testUsersRepository = TestUsersRepository(dataSource);

  @override
  Future<FailureOrResult<User>> getCurrentUser() async {
    return await makeSafeRequest(
      apiRequest: () async => await apiUsersRepository.getCurrentUser(),
      testRequest: () async => await testUsersRepository.getCurrentUser(),
    );
  }

  @override
  Future<FailureOrResult<bool>> hasPremium() async {
    return await makeSafeRequest(
      apiRequest: () async => await apiUsersRepository.hasPremium(),
      testRequest: () async => await testUsersRepository.hasPremium(),
    );
  }

  @override
  Future<FailureOrResult<User>> getUserByEmail(String email) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiUsersRepository.getUserByEmail(email),
      testRequest: () async => await testUsersRepository.getUserByEmail(email),
    );
  }

  @override
  Future<FailureOrResult<User>> updateUser(PatchUser patchUser) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiUsersRepository.updateUser(patchUser),
      testRequest: () async => await testUsersRepository.updateUser(patchUser),
    );
  }
}
