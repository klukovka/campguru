import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class PresentersModule {
  @lazySingleton
  CurrentUserOutputPort getCurrentUserOutputPort(
    SplashPageCubit splashPageCubit,
    HomePageCubit homePageCubit,
    ProfileTabCubit profileTabCubit,
    SignUpPageCubit signUpPageCubit,
    StartPageCubit startPageCubit,
  ) =>
      CurrentUserPresenter(
        splashPageCubit: splashPageCubit,
        homePageCubit: homePageCubit,
        profileTabCubit: profileTabCubit,
        signUpPageCubit: signUpPageCubit,
        startPageCubit: startPageCubit,
      );

  @lazySingleton
  ErrorHandlerOutputPort getErrorHandlerOutputPort() => ErrorHandlerPresenter();

  @lazySingleton
  LocationsOutputPort getLocationsOutputPort(
    LocationsTabCubit locationsTabCubit,
    LocationDetailsPageCubit locationDetailsPageCubit,
    RouteLocationsPageCubit routeLocationsPageCubit,
    LocationsFiltersPageCubit locationsFiltersPageCubit,
    FavoriteLocationsPageCubit favoriteLocationsPageCubit,
  ) =>
      LocationsPresenter(
        locationsTabCubit: locationsTabCubit,
        locationDetailsPageCubit: locationDetailsPageCubit,
        routeLocationsPageCubit: routeLocationsPageCubit,
        locationsFiltersPageCubit: locationsFiltersPageCubit,
        favoriteLocationsPageCubit: favoriteLocationsPageCubit,
      );

  @lazySingleton
  ReviewsOutputPort getReviewsOutputPort(
    LocationReviewsPageCubit locationReviewsPageCubit,
    RouteReviewsPageCubit routeReviewsPageCubit,
  ) =>
      ReviewsPresenter(
        locationReviewsPageCubit: locationReviewsPageCubit,
        routeReviewsPageCubit: routeReviewsPageCubit,
      );

  @lazySingleton
  RoutesOutputPort getRoutesOutputPort(
    RoutesTabCubit routesTabCubit,
    RouteDetailsPageCubit routeDetailsPageCubit,
    RoutesFiltersPageCubit routesFiltersPageCubit,
    HomePageCubit homePageCubit,
    RouteCacheProgressViewCubit routeCacheProgressViewCubit,
    RouteMapPageCubit routeMapPageCubit,
    CreateRoutePageCubit createRoutePageCubit,
    FavoriteRoutesTabCubit favoriteRoutesTabCubit,
    MyOwnRoutesTabCubit myOwnRoutesTabCubit,
    CachedRoutesTabCubit cachedRoutesTabCubit,
  ) =>
      RoutesPresenter(
        routesTabCubit: routesTabCubit,
        routeDetailsPageCubit: routeDetailsPageCubit,
        routesFiltersPageCubit: routesFiltersPageCubit,
        homePageCubit: homePageCubit,
        routeCacheProgressViewCubit: routeCacheProgressViewCubit,
        routeMapPageCubit: routeMapPageCubit,
        createRoutePageCubit: createRoutePageCubit,
        favoriteRoutesTabCubit: favoriteRoutesTabCubit,
        myOwnRoutesTabCubit: myOwnRoutesTabCubit,
        cachedRoutesTabCubit: cachedRoutesTabCubit,
      );

  @lazySingleton
  SettingsOutputPort getSettingsOutputPort(
    ProfileTabCubit profileTabCubit,
  ) =>
      SettingsPresenter(profileTabCubit: profileTabCubit);

  @lazySingleton
  TripsOutputPort getTripsOutputPort(
    TripsTabCubit tripsTabCubit,
    TripsFiltersPageCubit tripsFiltersPageCubit,
    TripDetailsPageCubit tripDetailsPageCubit,
  ) =>
      TripsPresenter(
        tripsTabCubit: tripsTabCubit,
        tripsFiltersPageCubit: tripsFiltersPageCubit,
        tripDetailsPageCubit: tripDetailsPageCubit,
      );

  @lazySingleton
  GeopositionOutputPort geopositionPresenter(
    RouteMapPageCubit routeMapPageCubit,
  ) =>
      GeopositionPresenter(
        routeMapPageCubit: routeMapPageCubit,
      );
}
