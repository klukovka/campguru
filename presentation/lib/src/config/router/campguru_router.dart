import 'package:domain/domain.dart';
import 'package:presentation/src/config/router/app_auto_router.dart';
import 'package:presentation/src/config/router/app_auto_router.gr.dart';
import 'package:presentation/src/config/router/base_router.dart';
import 'package:presentation/src/utils/extensions/domain_list_lat_lng_extension.dart';

class CampguruRouter extends BaseRouter {
  CampguruRouter(AppAutoRouter super.stackRouter);

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

  Future<void> pushRouteMap({
    required List<LatLng> locations,
    required List<LatLng> polyline,
  }) =>
      push(
        RouteMapRoute(
          locations: locations.toRouteParams(),
          polyline: polyline.toRouteParams(),
        ),
      );

  Future<void> pushLocationsFiltersPage() =>
      push(const LocationsFiltersRoute());

  Future<void> pushRoutesFiltersPage() => push(const RoutesFiltersRoute());
}
