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
    routesTabCubit.setFilter(filter);
  }

  @override
  void stopAllRoutesLoading() {
    routesTabCubit.stopLoading();
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
    final allRoutes = routesTabCubit.state.routes.map((item) {
      return item.id == routeId ? item.copyWith(isFavorite: isFavorite) : item;
    }).toList();

    routesTabCubit.setRoutes(allRoutes);
//TODO: Uncomment when page is completed
    // if (routeDetailsPageCubit.state.route.id == routeId) {
    //   routeDetailsPageCubit.updateRouteFavoriteStatus(
    //     isFavorite,
    //   );
    // }
  }

  @override
  void updateRouteDetails(Route route) {
    final allRoutes = routesTabCubit.state.routes.map((item) {
      return item.id == route.id ? item.merge(route) : item;
    }).toList();

    routesTabCubit.setRoutes(allRoutes);
//TODO: Uncomment when page is completed
    // routeDetailsPageCubit.updateRoute(route);
  }

  @override
  void startRouteDetailsLoading() {
//TODO: Uncomment when page is completed

    // routeDetailsPageCubit.startLoading();
  }

  @override
  void updateRouteDetailsBriefly(int routeId) {
    final route = routesTabCubit.state.routes.cast<Route?>().firstWhere(
          (route) => route?.id == routeId,
          orElse: () => null,
        );

//TODO: Uncomment when page is completed

    // if (route != null) {
    //   routeDetailsPageCubit.updateRoute(route);
    // } else {
    //   routeDetailsPageCubit.setHasError();
    // }
  }
}
