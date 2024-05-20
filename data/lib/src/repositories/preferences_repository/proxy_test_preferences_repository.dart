import 'package:data/data.dart';
import 'package:data/src/core/proxy_test_repository.dart';
import 'package:data/src/repositories/preferences_repository/test_preferences_repository.dart';
import 'package:domain/domain.dart';

class ProxyTestPreferencesRepository extends ProxyTestRepository
    implements PreferencesRepository {
  final StablePreferencesRepository stableRepository;
  final TestPreferencesRepository testRepository;

  ProxyTestPreferencesRepository(HiveDataSource dataSource)
      : stableRepository = StablePreferencesRepository(dataSource),
        testRepository = TestPreferencesRepository(dataSource);

  @override
  String get accessToken => makeSafeCall(
        apiRequest: () => stableRepository.accessToken,
        testRequest: () => testRepository.accessToken,
      );

  @override
  Future<void> clearTokens() async {
    await makeAsyncCall(
      apiRequest: () async => await stableRepository.clearTokens(),
      testRequest: () async => await testRepository.clearTokens(),
    );
  }

  @override
  bool get hasRefreshToken => makeSafeCall(
        apiRequest: () => stableRepository.hasRefreshToken,
        testRequest: () => testRepository.hasRefreshToken,
      );

  @override
  bool get hasToken => makeSafeCall(
        apiRequest: () => stableRepository.hasToken,
        testRequest: () => testRepository.hasToken,
      );

  @override
  bool get isLoggedIn => makeSafeCall(
        apiRequest: () => stableRepository.isLoggedIn,
        testRequest: () => testRepository.isLoggedIn,
      );

  @override
  bool get isTokenExpired => makeSafeCall(
        apiRequest: () => stableRepository.isTokenExpired,
        testRequest: () => testRepository.isTokenExpired,
      );

  @override
  String get refreshToken => makeSafeCall(
        apiRequest: () => stableRepository.refreshToken,
        testRequest: () => testRepository.refreshToken,
      );

  @override
  Future<void> setAuthDetails(AuthenticationDetails details) async {
    await makeAsyncCall(
      apiRequest: () async => await stableRepository.setAuthDetails(details),
      testRequest: () async => await testRepository.setAuthDetails(details),
    );
  }

  @override
  int get userId => makeSafeCall(
        apiRequest: () => stableRepository.userId,
        testRequest: () => testRepository.userId,
      );
}
