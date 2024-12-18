import 'package:data/src/models/routes/lat_lng_dto.dart';
import 'package:data/src/models/routes/route_hive_dto.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataSource {
  static const _preferencesBoxKey = '_preferencesBoxKey';
  static const _routesBoxKey = '_routesBoxKey';

  static const _userIdKey = '_userIdKey';
  static const _accessTokenKey = '_accessTokenKey';
  static const _refreshTokenKey = '_refreshTokenKey';
  static const _localeKey = '_localeKey';
  static const _themeModeKey = '_themeModeKey';

  final Box<dynamic> _preferencesBox;
  final Box<RouteHiveDto> _routesBox;

  HiveDataSource(this._preferencesBox, this._routesBox);

  static Future<HiveDataSource> getInstance() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(LatLngDtoAdapter())
      ..registerAdapter(RouteHiveDtoAdapter());
    final box = await Hive.openBox<dynamic>(_preferencesBoxKey);
    final routesBox = await Hive.openBox<RouteHiveDto>(_routesBoxKey);
    return HiveDataSource(box, routesBox);
  }

  ///
  /// Auth
  ///

  String get accessToken =>
      _preferencesBox.get(_accessTokenKey, defaultValue: '');

  Future<void> clearTokens() async {
    await _preferencesBox.delete(_accessTokenKey);
    await _preferencesBox.delete(_refreshTokenKey);
    await _preferencesBox.delete(_userIdKey);
  }

  String get refreshToken =>
      _preferencesBox.get(_refreshTokenKey, defaultValue: '');

  Future<void> setAuthDetails(AuthenticationDetails details) async {
    await _preferencesBox.put(_accessTokenKey, details.accessJwtToken);
    await _preferencesBox.put(_userIdKey, details.userId);
    await _preferencesBox.put(_refreshTokenKey, details.refreshJwtToken);
  }

  int get userId => _preferencesBox.get(_userIdKey, defaultValue: -1);

  ///
  /// Routes
  ///

  Future<void> saveRoute(RouteHiveDto route) async {
    await _routesBox.put(route.id, route);
  }

  RouteHiveDto? getRoute(int id) {
    return _routesBox.get(id);
  }

  List<RouteHiveDto> getCachedRoutes() => _routesBox.values.toList();

  Future<void> deleteRoute(int id) async {
    await _routesBox.delete(id);
  }

  ///
  /// Locales
  ///

  String? getLanguageCode() => _preferencesBox.get(_localeKey);

  Future<void> setLanguageCode(String languageCode) async =>
      await _preferencesBox.put(_localeKey, languageCode);

  ///
  /// Theme Mode
  ///

  String getThemeMode() => _preferencesBox.get(_themeModeKey) ?? 'system';
  Future<void> setThemeMode(String themeMode) async =>
      await _preferencesBox.put(_themeModeKey, themeMode);
}
