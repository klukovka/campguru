import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProfileTabController {
  final LogoutUseCase logoutUseCase;
  final ChangeLocaleUseCase changeLocaleUseCase;
  final ChangeThemeModeUseCase changeThemeModeUseCase;

  ProfileTabController({
    required this.logoutUseCase,
    required this.changeLocaleUseCase,
    required this.changeThemeModeUseCase,
  });

  void logout() {
    logoutUseCase();
  }

  void setLocale(String languageCode) {
    changeLocaleUseCase(languageCode);
  }

  void setAppTheme(ThemeMode theme) {
    changeThemeModeUseCase(theme.name);
  }
}
