import 'package:domain/domain.dart';
import 'package:hive/hive.dart';

class TestPreferencesRepository implements PreferencesRepository {
  static const _preferencesBox = '_testPreferencesBox';

  static const _userIdKey = '_userIdKey';
  static const _accessTokenKey = '_accessTokenKey';
  static const _refreshTokenKey = '_refreshTokenKey';

  final Box<dynamic> _box;

  TestPreferencesRepository(this._box);

  static Future<TestPreferencesRepository> getInstance() async {
    final box = await Hive.openBox<dynamic>(_preferencesBox);
    return TestPreferencesRepository(box);
  }

  @override
  String get accessToken => _box.get(_accessTokenKey, defaultValue: '');

  @override
  Future<void> clearTokens() async {
    await _box.delete(_accessTokenKey);
    await _box.delete(_refreshTokenKey);
    await _box.delete(_userIdKey);
  }

  @override
  bool get hasRefreshToken => refreshToken.isNotEmpty;

  @override
  bool get hasToken => accessToken.isNotEmpty;

  @override
  bool get isLoggedIn => hasToken && !isTokenExpired;

  @override
  bool get isTokenExpired => accessToken.isEmpty;

  @override
  String get refreshToken => _box.get(_refreshTokenKey, defaultValue: '');

  @override
  Future<void> setAuthDetails(AuthenticationDetails details) async {
    await _box.put(_accessTokenKey, details.accessJwtToken);
    await _box.put(_userIdKey, details.userId);
    await _box.put(_refreshTokenKey, details.refreshJwtToken);
  }

  @override
  int get userId => _box.get(_userIdKey, defaultValue: -1);
}
