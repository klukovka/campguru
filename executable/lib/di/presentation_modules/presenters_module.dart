import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class PresentersModule {
  @lazySingleton
  CurrentUserOutputPort getCurrentUserOutputPort(
    SplashPageCubit splashPageCubit,
    HomePageCubit homePageCubit,
  ) =>
      CurrentUserPresenter(
        splashPageCubit: splashPageCubit,
        homePageCubit: homePageCubit,
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
  ) =>
      RoutesPresenter(
        routesTabCubit: routesTabCubit,
        routeDetailsPageCubit: routeDetailsPageCubit,
      );
}
