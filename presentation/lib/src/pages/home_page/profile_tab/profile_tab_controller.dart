import 'package:domain/domain.dart';

class ProfileTabController {
  final LogoutUseCase logoutUseCase;

  ProfileTabController({required this.logoutUseCase});

  void logout() {
    logoutUseCase();
  }
}
