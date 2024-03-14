import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class ControllersModule {
  @lazySingleton
  SplashPageController getSplashPageController(
    IsAuthorizedUseCase isAuthorizedUseCase,
    GetAllLocationsUseCase getAllLocationsUseCase,
  ) =>
      SplashPageController(
        isAuthorizedUseCase: isAuthorizedUseCase,
        getAllLocationsUseCase: getAllLocationsUseCase,
      );

  @lazySingleton
  LocationsTabController getLocationsTabController(
    GetAllLocationsUseCase getAllLocationsUseCase,
  ) =>
      LocationsTabController(
        getAllLocationsUseCase,
      );

  @lazySingleton
  LocationFavoriteButtonController getLocationFavoriteButtonController(
    UpdateLocationFavoriteStatusUseCase updateLocationFavoriteStatusUseCase,
  ) =>
      LocationFavoriteButtonController(updateLocationFavoriteStatusUseCase);

  @lazySingleton
  LocationDetailsPageController getLocationDetailsPageController(
    GetLocationDetailsUseCase getLocationDetailsUseCase,
  ) =>
      LocationDetailsPageController(getLocationDetailsUseCase);

  @lazySingleton
  LocationReviewsPageController getLocationReviewsPageController(
    GetLocationReviewsUseCase getLocationReviewsUseCase,
  ) =>
      LocationReviewsPageController(getLocationReviewsUseCase);

  @lazySingleton
  RoutesTabController getRoutesTabController(
    GetAllRoutesUseCase getAllRoutesUseCase,
  ) =>
      RoutesTabController(
        getAllRoutesUseCase,
      );

  @lazySingleton
  RouteFavoriteButtonController getRouteFavoriteButtonController(
    UpdateRouteFavoriteStatusUseCase updateRouteFavoriteStatusUseCase,
  ) =>
      RouteFavoriteButtonController(updateRouteFavoriteStatusUseCase);
}
