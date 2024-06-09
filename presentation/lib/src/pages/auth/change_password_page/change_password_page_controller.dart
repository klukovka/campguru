import 'package:domain/domain.dart';

class ChangePasswordPageController {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordPageController(this.changePasswordUseCase);

  void call(PatchPassword patchPassword) {
    changePasswordUseCase(patchPassword);
  }
}
