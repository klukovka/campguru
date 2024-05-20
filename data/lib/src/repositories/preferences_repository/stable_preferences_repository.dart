import 'package:data/src/data_source/hive_data_source.dart';
import 'package:domain/domain.dart';
import 'package:jwt_decode/jwt_decode.dart';

class StablePreferencesRepository implements PreferencesRepository {
  final HiveDataSource _dataSource;

  StablePreferencesRepository(this._dataSource);

  @override
  String get accessToken => _dataSource.accessToken;

  @override
  Future<void> clearTokens() async => await _dataSource.clearTokens();

  @override
  bool get hasRefreshToken => refreshToken.isNotEmpty;

  @override
  bool get hasToken => accessToken.isNotEmpty;

  @override
  bool get isLoggedIn => hasToken && !isTokenExpired;

  @override
  bool get isTokenExpired {
    final token = accessToken;

    if (token.isEmpty) return true;

    return Jwt.isExpired(token);
  }

  @override
  String get refreshToken => _dataSource.refreshToken;

  @override
  Future<void> setAuthDetails(AuthenticationDetails details) async =>
      await _dataSource.setAuthDetails(details);

  @override
  int get userId => _dataSource.userId;
}