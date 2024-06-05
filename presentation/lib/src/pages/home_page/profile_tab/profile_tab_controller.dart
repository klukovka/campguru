import 'package:domain/domain.dart';

class ProfileTabController {
  final LogoutUseCase logoutUseCase;
  final ChangeLocaleUseCase changeLocaleUseCase;

  ProfileTabController({
    required this.logoutUseCase,
    required this.changeLocaleUseCase,
  });

  void logout() {
    logoutUseCase();
  }

  void setLocale(String languageCode) {
    changeLocaleUseCase(languageCode);
  }
}
