import 'package:domain/domain.dart';

class LoginUseCase {
  final PreferencesRepository preferencesRepository;
  final AuthRepository authRepository;
  final CurrentUserOutputPort currentUserOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  LoginUseCase({
    required this.preferencesRepository,
    required this.authRepository,
    required this.currentUserOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(LoginUser loginUser) async {
    currentUserOutputPort.startLogin();
    final details = await authRepository.login(loginUser);

    if (details.hasFailed) {
      errorHandlerOutputPort.setError(details.failure!);
      currentUserOutputPort.loginFailed();
      return;
    }

    await preferencesRepository.setAuthDetails(details.result!);
    currentUserOutputPort.loginCompleted();
  }
}
