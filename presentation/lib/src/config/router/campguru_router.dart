import 'package:domain/domain.dart';
import 'package:presentation/src/config/router/app_auto_router.dart';
import 'package:presentation/src/config/router/app_auto_router.gr.dart';
import 'package:presentation/src/config/router/base_router.dart';

class CampguruRouter extends BaseRouter {
  CampguruRouter(AppAutoRouter super.stackRouter);

  Future<void> replaceToSplashPage() => pushAndClearStack(const SplashRoute());

  Future<void> replaceToHomePage() => pushAndClearStack(const HomeRoute());

  Future<void> replaceToStartPage() => pushAndClearStack(const StartRoute());

  Future<void> pushLocationDetailsPage(int id) =>
      push(LocationDetailsRoute(locationId: id));

  Future<void> pushLocationReviewsPage(int id) =>
      push(LocationReviewsRoute(locationId: id));

  Future<void> pushLocationMap({double? lat, double? lng}) => push(
        LocationMapRoute(
          lat: lat ?? 0,
          lng: lng ?? 0,
        ),
      );

  Future<void> pushRouteDetailsPage(int id) =>
      push(RouteDetailsRoute(routeId: id));

  Future<void> pushRouteLocationsPage(int id) =>
      push(RouteLocationsRoute(routeId: id));

  Future<void> pushRouteReviewsPage(int id) =>
      push(RouteReviewsRoute(routeId: id));

  Future<void> pushRouteMap(int id) => push(RouteMapRoute(routeId: id));

  Future<void> pushLocationsFiltersPage() =>
      push(const LocationsFiltersRoute());

  Future<void> pushRoutesFiltersPage() => push(const RoutesFiltersRoute());

  Future<void> pushTripsFiltersPage() => push(const TripsFiltersRoute());

  Future<void> pushTripDetailsPage(int id) =>
      push(TripDetailsRoute(tripId: id));

  Future<void> pushFavoriteLocationsPage() =>
      push(const FavoriteLocationsRoute());

  Future<void> pushCreateRoutePage() => push(const CreateRouteRoute());

  Future<List<Location>?> pushSelectableLocationsPage(
    List<Location> selectedLocations,
  ) =>
      push<List<Location>>(
        SelectableLocationsRoute(selectedLocations: selectedLocations),
      );

  Future<void> replaceRouteDetailsPage(int id) =>
      replace(RouteDetailsRoute(routeId: id));

  Future<void> pushMyRoutesPage() => push(const MyRoutesRoute());

  Future<void> pushSignUpPage() => push(const SignUpRoute());
}
