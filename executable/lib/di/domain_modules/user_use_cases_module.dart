import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UserUseCasesModule {
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
}
