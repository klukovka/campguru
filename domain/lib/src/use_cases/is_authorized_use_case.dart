import 'package:domain/domain.dart';

class IsAuthorizedUseCase {
  final PreferencesRepository preferencesRepository;
  final AuthRepository authRepository;
  final UsersRepository usersRepository;
  final AuthOutputPort authOutputPort;

  IsAuthorizedUseCase({
    required this.preferencesRepository,
    required this.authRepository,
    required this.usersRepository,
    required this.authOutputPort,
  });

  Future<void> call() async {
    if (preferencesRepository.isTokenExpired) {
      final refreshToken = preferencesRepository.refreshToken;
      final authDetails = await authRepository.refreshToken(refreshToken);
      if (authDetails.wasSuccessful) {
        preferencesRepository.setAuthDetails(authDetails.result!);
      } else {
        authOutputPort.setCurrentUser(null);
        return;
      }
    }

    final user = await usersRepository.getCurrentUser();

    if (user.wasSuccessful) {
      authOutputPort.setCurrentUser(user.result);
    } else {
      authOutputPort.setCurrentUser(null);
    }
  }
}
