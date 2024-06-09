import 'package:domain/domain.dart';

class ResetPasswordUseCase {
  final AuthRepository authRepository;
  final CurrentUserOutputPort currentUserOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  ResetPasswordUseCase({
    required this.authRepository,
    required this.currentUserOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(String email) async {
    currentUserOutputPort.startResetPassword();
    final details = await authRepository.resetPassword(email);

    if (details.hasFailed) {
      errorHandlerOutputPort.setError(details.failure!);
      currentUserOutputPort.resetPasswordFailed();
      return;
    }

    currentUserOutputPort.resetPasswordCompleted();
  }
}
