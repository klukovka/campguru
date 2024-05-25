import 'package:domain/domain.dart';

class StartPageController {
  final LoginUseCase loginUseCase;

  StartPageController(this.loginUseCase);

  void call(LoginUser loginUser) {
    loginUseCase(loginUser);
  }
}
