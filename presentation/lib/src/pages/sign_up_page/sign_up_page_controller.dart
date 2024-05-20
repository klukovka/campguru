import 'package:domain/domain.dart';

class SignUpPageController {
  final SignUpUseCase signUpUseCase;

  SignUpPageController(this.signUpUseCase);

  void call(NewUser newUser) {
    signUpUseCase(newUser);
  }
}
