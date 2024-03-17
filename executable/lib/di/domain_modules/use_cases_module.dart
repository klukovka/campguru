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

  @lazySingleton
  GetLocationReviewsUseCase getLocationReviewssUseCase(
    ReviewsRepository reviewsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    ReviewsOutputPort reviewsOutputPort,
  ) =>
      GetLocationReviewsUseCase(
        reviewsRepository: reviewsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        reviewsOutputPort: reviewsOutputPort,
      );

  @lazySingleton
  GetAllRoutesUseCase getAllRoutesUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetAllRoutesUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  UpdateRouteFavoriteStatusUseCase getUpdateRouteFavoriteStatusUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      UpdateRouteFavoriteStatusUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
      );

  @lazySingleton
  GetRouteDetailsUseCase getRouteDetailsUseCase(
    RoutesRepository routesRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    RoutesOutputPort routesOutputPort,
  ) =>
      GetRouteDetailsUseCase(
        routesRepository: routesRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        routesOutputPort: routesOutputPort,
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

  @lazySingleton
  GetRouteReviewsUseCase getRouteReviewsUseCase(
    ReviewsRepository reviewsRepository,
    ErrorHandlerOutputPort errorHandlerOutputPort,
    ReviewsOutputPort reviewsOutputPort,
  ) =>
      GetRouteReviewsUseCase(
        reviewsRepository: reviewsRepository,
        errorHandlerOutputPort: errorHandlerOutputPort,
        reviewsOutputPort: reviewsOutputPort,
      );
}
