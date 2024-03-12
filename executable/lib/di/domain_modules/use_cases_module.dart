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
  GetAllLocationsUseCase getAllLocationsUseCase(
    LocationsRepository locationsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    LocationsOutputPort locationsOutputPort,
  ) =>
      GetAllLocationsUseCase(
        locationsRepository: locationsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        locationsOutputPort: locationsOutputPort,
      );

  @lazySingleton
  UpdateLocationFavoriteStatusUseCase getUpdateLocationFavoriteStatusUseCase(
    LocationsRepository locationsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    LocationsOutputPort locationsOutputPort,
  ) =>
      UpdateLocationFavoriteStatusUseCase(
        locationsRepository: locationsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        locationsOutputPort: locationsOutputPort,
      );

  @lazySingleton
  GetLocationDetailsUseCase getLocationDetailsUseCase(
    LocationsRepository locationsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    LocationsOutputPort locationsOutputPort,
  ) =>
      GetLocationDetailsUseCase(
        locationsRepository: locationsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        locationsOutputPort: locationsOutputPort,
      );
}
