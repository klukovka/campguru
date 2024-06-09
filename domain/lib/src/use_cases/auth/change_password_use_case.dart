import 'package:domain/domain.dart';

class ChangePasswordUseCase {
  final AuthRepository authRepository;
  final CurrentUserOutputPort currentUserOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  ChangePasswordUseCase({
    required this.authRepository,
    required this.currentUserOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(PatchPassword patchPassword) async {
    currentUserOutputPort.startChangePassword();
    final details = await authRepository.changePassword(patchPassword);

    if (details.hasFailed) {
      errorHandlerOutputPort.setError(details.failure!);
      currentUserOutputPort.changePasswordFailed();
      return;
    }

    currentUserOutputPort.changePasswordCompleted();
  }
}
