import 'package:domain/domain.dart';

class ResetPasswordPageController {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordPageController(this.resetPasswordUseCase);

  void call(String email) {
    resetPasswordUseCase(email);
  }
}
