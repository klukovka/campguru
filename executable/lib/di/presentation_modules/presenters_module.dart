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
  ) =>
      CurrentUserPresenter(
        splashPageCubit: splashPageCubit,
        homePageCubit: homePageCubit,
        profileTabCubit: profileTabCubit,
      );

  @lazySingleton
  ErrorHandlerOutputPort getErrorHandlerOutputPort() => ErrorHandlerPresenter();

  @lazySingleton
  LocationsOutputPort getLocationsOutputPort(
    LocationsTabCubit locationsTabCubit,
    LocationDetailsPageCubit locationDetailsPageCubit,
    RouteLocationsPageCubit routeLocationsPageCubit,
    LocationsFiltersPageCubit locationsFiltersPageCubit,
  ) =>
      LocationsPresenter(
        locationsTabCubit: locationsTabCubit,
        locationDetailsPageCubit: locationDetailsPageCubit,
        routeLocationsPageCubit: routeLocationsPageCubit,
        locationsFiltersPageCubit: locationsFiltersPageCubit,
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
  ) =>
      RoutesPresenter(
        routesTabCubit: routesTabCubit,
        routeDetailsPageCubit: routeDetailsPageCubit,
        routesFiltersPageCubit: routesFiltersPageCubit,
        homePageCubit: homePageCubit,
        routeCacheProgressViewCubit: routeCacheProgressViewCubit,
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
}
