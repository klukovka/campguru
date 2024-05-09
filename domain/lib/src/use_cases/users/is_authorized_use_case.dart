import 'package:domain/domain.dart';

class IsAuthorizedUseCase {
  final PreferencesRepository preferencesRepository;
  final AuthRepository authRepository;
  final UsersRepository usersRepository;
  final CurrentUserOutputPort currentUserOutputPort;
  final ErrorHandlerOutputPort errorHandlerOutputPort;

  IsAuthorizedUseCase({
    required this.preferencesRepository,
    required this.authRepository,
    required this.usersRepository,
    required this.currentUserOutputPort,
    required this.errorHandlerOutputPort,
  });

  Future<void> call() async {
    if (preferencesRepository.isTokenExpired) {
      final refreshToken = preferencesRepository.refreshToken;
      final authDetails = await authRepository.refreshToken(refreshToken);
      if (authDetails.wasSuccessful) {
        preferencesRepository.setAuthDetails(authDetails.result!);
      } else {
        currentUserOutputPort.setCurrentUser(null);
        errorHandlerOutputPort.setError(authDetails.failure!);
        return;
      }
    }

    final user = await usersRepository.getCurrentUser();

    if (user.wasSuccessful) {
      currentUserOutputPort.setCurrentUser(user.result);
      //TODO: Preload all data
    } else {
      currentUserOutputPort.setCurrentUser(null);
      errorHandlerOutputPort.setError(user.failure!);
    }
  }
}