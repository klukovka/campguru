import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocationUseCasesCasesModule {
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

  @lazySingleton
  GetRouteLocationsUseCase getRouteLocationsUseCase(
    LocationsRepository locationsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    LocationsOutputPort locationsOutputPort,
  ) =>
      GetRouteLocationsUseCase(
        locationsRepository: locationsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        locationsOutputPort: locationsOutputPort,
      );
}
