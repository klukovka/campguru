import 'package:domain/domain.dart';

abstract class PreferencesRepository {
  ///
  /// Auth Tokens
  ///

  bool get hasToken;
  bool get hasRefreshToken;
  bool get isTokenExpired;
  bool get isLoggedIn;
  String get accessToken;
  String get refreshToken;
  int get userId;
  Future<void> setAuthDetails(AuthenticationDetails details);
  Future<void> clearTokens();

  ///
  /// Locales
  ///

  String getLanguageCode();
  Future<void> setLanguageCode(String languageCode);
}
