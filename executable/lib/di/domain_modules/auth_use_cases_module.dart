import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthUseCasesModule {
  @lazySingleton
  ChangePasswordUseCase changePasswordUseCase(
    AuthRepository authRepository,
    CurrentUserOutputPort currentUserOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      ChangePasswordUseCase(
        authRepository: authRepository,
        currentUserOutputPort: currentUserOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );

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

  @lazySingleton
  LogoutUseCase logoutUseCase(
    PreferencesRepository preferencesRepository,
    CacheRepository cacheRepository,
  ) =>
      LogoutUseCase(
        preferencesRepository: preferencesRepository,
        cacheRepository: cacheRepository,
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
  ResetPasswordUseCase resetPasswordUseCase(
    AuthRepository authRepository,
    CurrentUserOutputPort currentUserOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      ResetPasswordUseCase(
        authRepository: authRepository,
        currentUserOutputPort: currentUserOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );
}
