import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class RoutesPresenter extends RoutesOutputPort {
  final RoutesTabCubit routesTabCubit;
  final RouteDetailsPageCubit routeDetailsPageCubit;
  final RoutesFiltersPageCubit routesFiltersPageCubit;

  RoutesPresenter({
    required this.routesTabCubit,
    required this.routeDetailsPageCubit,
    required this.routesFiltersPageCubit,
  });

  @override
  void setAllRoutesFilter(Filter filter) {
    routesTabCubit.setFilter(filter);
    routesFiltersPageCubit.updateCurrentFilter(filter);
  }

  @override
  void stopAllRoutesLoading() {
    routesTabCubit.stopLoading();
    routesFiltersPageCubit.stopLoading();
  }

  @override
  void updateAllRoutes(List<Route> routes, int amount) {
    final append = routesTabCubit.state.filter.append;

    if (append) {
      routesTabCubit.appendRoutes(routes);
    } else {
      routesTabCubit.setRoutes(routes, amount: amount);
    }
  }

  @override
  void updateRouteFavoriteStatus(int routeId, bool isFavorite) {
    final allRoutes = routesTabCubit.state.routes.updateFavoriteStatus(
      routeId,
      isFavorite,
    );

    routesTabCubit.setRoutes(allRoutes);
    if (routeDetailsPageCubit.state.route.id == routeId) {
      routeDetailsPageCubit.updateRouteFavoriteStatus(
        isFavorite,
      );
    }
  }

  @override
  void updateRouteDetails(Route route) {
    final allRoutes = routesTabCubit.state.routes.merge(route);

    routesTabCubit.setRoutes(allRoutes);
    routeDetailsPageCubit.updateRoute(route);
  }

  @override
  void startRouteDetailsLoading() {
    routeDetailsPageCubit.startLoading();
  }

  @override
  void updateRouteDetailsBriefly(int routeId) {
    final route = routesTabCubit.state.routes.firstWhereOrNull(
      (route) => route.id == routeId,
    );

    if (route != null) {
      routeDetailsPageCubit.updateRoute(route);
    } else {
      routeDetailsPageCubit.setHasError();
    }
  }
}
