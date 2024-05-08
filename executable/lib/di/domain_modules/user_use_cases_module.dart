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
    ErrorHandlerOutputPort errorHandlerOutputPort,
  ) =>
      IsAuthorizedUseCase(
        preferencesRepository: preferencesRepository,
        authRepository: authRepository,
        usersRepository: usersRepository,
        currentUserOutputPort: currentUserOutputPort,
        errorHandlerOutputPort: errorHandlerOutputPort,
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
}
