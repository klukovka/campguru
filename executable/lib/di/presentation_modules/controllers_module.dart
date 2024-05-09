import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class ControllersModule {
  @lazySingleton
  SplashPageController getSplashPageController(
    IsAuthorizedUseCase isAuthorizedUseCase,
    GetAllLocationsUseCase getAllLocationsUseCase,
    GetAllRoutesUseCase getAllRoutesUseCase,
    GetLocationsAvailableFiltersUseCase getLocationsAvailableFiltersUseCase,
    GetRoutesAvailableFiltersUseCase getRoutesAvailableFiltersUseCase,
  ) =>
      SplashPageController(
        isAuthorizedUseCase: isAuthorizedUseCase,
        getAllLocationsUseCase: getAllLocationsUseCase,
        getAllRoutesUseCase: getAllRoutesUseCase,
        getLocationsAvailableFiltersUseCase:
            getLocationsAvailableFiltersUseCase,
        getRoutesAvailableFiltersUseCase: getRoutesAvailableFiltersUseCase,
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

  @lazySingleton
  RouteDetailsPageController getRouteDetailsPageController(
    GetRouteDetailsUseCase getRouteDetailsUseCase,
  ) =>
      RouteDetailsPageController(getRouteDetailsUseCase);

  @lazySingleton
  RouteLocationsPageController getRouteLocationsController(
    GetRouteLocationsUseCase getRouteLocationsUseCase,
  ) =>
      RouteLocationsPageController(getRouteLocationsUseCase);

  @lazySingleton
  RouteReviewsPageController getRouteReviewsPageController(
    GetRouteReviewsUseCase getRouteReviewsUseCase,
  ) =>
      RouteReviewsPageController(getRouteReviewsUseCase);

  @lazySingleton
  LocationFiltersPageController getLocationFiltersPageController(
    GetAllLocationsUseCase getAllLocationsUseCase,
  ) =>
      LocationFiltersPageController(getAllLocationsUseCase);

  @lazySingleton
  RouteFiltersPageController getRouteFiltersPageController(
    GetAllRoutesUseCase getAllRoutesUseCase,
  ) =>
      RouteFiltersPageController(getAllRoutesUseCase);
}
