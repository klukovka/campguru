import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class RoutesPresenter extends RoutesOutputPort {
  final RoutesTabCubit routesTabCubit;
  final RouteDetailsPageCubit routeDetailsPageCubit;

  RoutesPresenter({
    required this.routesTabCubit,
    required this.routeDetailsPageCubit,
  });
  @override
  void setAllRoutesFilter(Filter filter) {
    // TODO: implement setAllRoutesFilter
  }

  @override
  void startRouteDetailsLoading() {
    // TODO: implement startRouteDetailsLoading
  }

  @override
  void stopAllRoutesLoading() {
    // TODO: implement stopAllRoutesLoading
  }

  @override
  void updateAllRoutes(List<Route> routes, int amount) {
    // TODO: implement updateAllRoutes
  }

  @override
  void updateRouteDetails(Route route) {
    // TODO: implement updateRouteDetails
  }

  @override
  void updateRouteDetailsBriefly(int routeId) {
    // TODO: implement updateRouteDetailsBriefly
  }

  @override
  void updateRouteFavoriteStatus(int routeId, bool isFavorite) {
    // TODO: implement updateRouteFavoriteStatus
  }
}
