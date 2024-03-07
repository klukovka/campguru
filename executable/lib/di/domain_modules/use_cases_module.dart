import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UseCasesModule {
  @lazySingleton
  IsAuthorizedUseCase getIsAuthorizedUseCase(
    PreferencesRepository preferencesRepository,
    AuthRepository authRepository,
    UsersRepository usersRepository,
    CurrentUserOutputPort currentUserOutputPort,
  ) =>
      IsAuthorizedUseCase(
        preferencesRepository: preferencesRepository,
        authRepository: authRepository,
        usersRepository: usersRepository,
        currentUserOutputPort: currentUserOutputPort,
      );
}
