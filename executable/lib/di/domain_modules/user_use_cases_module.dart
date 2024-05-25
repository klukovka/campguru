import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UserUseCasesModule {
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

  @lazySingleton
  GetUserSubscriptionStatus getUserSubscriptionStatus(
    UsersRepository usersRepository,
    LocationsOutputPort locationsOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      GetUserSubscriptionStatus(
        usersRepository: usersRepository,
        locationsOutputPort: locationsOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );

  @lazySingleton
  SignUpUseCase signUpUseCase(
    PreferencesRepository preferencesRepository,
    AuthRepository authRepository,
    CurrentUserOutputPort currentUserOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      SignUpUseCase(
        preferencesRepository: preferencesRepository,
        authRepository: authRepository,
        currentUserOutputPort: currentUserOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );

  @lazySingleton
  LoginUseCase loginUseCase(
    PreferencesRepository preferencesRepository,
    AuthRepository authRepository,
    CurrentUserOutputPort currentUserOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      LoginUseCase(
        preferencesRepository: preferencesRepository,
        authRepository: authRepository,
        currentUserOutputPort: currentUserOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );
}
