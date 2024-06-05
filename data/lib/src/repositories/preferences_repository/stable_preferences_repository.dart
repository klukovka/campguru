import 'dart:io';

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

    try {
      return Jwt.isExpired(token);
    } catch (_) {
      return true;
    }
  }

  @override
  String get refreshToken => _dataSource.refreshToken;

  @override
  Future<void> setAuthDetails(AuthenticationDetails details) async =>
      await _dataSource.setAuthDetails(details);

  @override
  int get userId => _dataSource.userId;

  @override
  String getLanguageCode() =>
      _dataSource.getLanguageCode() ?? Platform.localeName;

  @override
  Future<void> setLanguageCode(String languageCode) async {
    await _dataSource.setLanguageCode(languageCode);
  }

  @override
  String getThemeMode() => _dataSource.getThemeMode();

  @override
  Future<void> setThemeMode(String themeMode) async =>
      await _dataSource.setThemeMode(themeMode);
}
