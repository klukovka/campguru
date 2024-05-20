import 'package:domain/domain.dart';

class SignUpUseCase {
  final PreferencesRepository preferencesRepository;
  final AuthRepository authRepository;
  final CurrentUserOutputPort currentUserOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  SignUpUseCase({
    required this.preferencesRepository,
    required this.authRepository,
    required this.currentUserOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call(NewUser newUser) async {
    currentUserOutputPort.startSignUp();
    final details = await authRepository.signUp(newUser);

    if (details.hasFailed) {
      errorHandlerOutputPort.setError(details.failure!);
      currentUserOutputPort.signUpFailed();
      return;
    }

    await preferencesRepository.setAuthDetails(details.result!);
    currentUserOutputPort.signUpCompleted();
  }
}
