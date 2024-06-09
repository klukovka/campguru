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
  GetUserByEmailUseCase getUserByEmailUseCase(
    UsersRepository usersRepository,
    UsersOutputPort usersOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      GetUserByEmailUseCase(
        usersRepository: usersRepository,
        usersOutputPort: usersOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
      );

  @lazySingleton
  RemoveUserFromCreatingTripUseCase removeUserFromCreatingTripUseCase(
    UsersOutputPort usersOutputPort,
  ) =>
      RemoveUserFromCreatingTripUseCase(
        usersOutputPort: usersOutputPort,
      );

  @lazySingleton
  EditProfileUseCase editProfileUseCase(
    UsersRepository usersRepository,
    CurrentUserOutputPort currentUserOutputPort,
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      EditProfileUseCase(
        usersRepository: usersRepository,
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
