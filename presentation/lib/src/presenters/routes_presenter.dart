import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class RoutesPresenter extends RoutesOutputPort {
  final RoutesTabCubit routesTabCubit;
  final RouteDetailsPageCubit routeDetailsPageCubit;
  final RoutesFiltersPageCubit routesFiltersPageCubit;
  final HomePageCubit homePageCubit;
  final RouteCacheProgressViewCubit routeCacheProgressViewCubit;

  RoutesPresenter({
    required this.routesTabCubit,
    required this.routeDetailsPageCubit,
    required this.routesFiltersPageCubit,
    required this.homePageCubit,
    required this.routeCacheProgressViewCubit,
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

    routesFiltersPageCubit.stopLoading();
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

  @override
  void updateRoutesAvailableFilters(List<PremiumBasedFilterLabel> labels) {
    routesFiltersPageCubit.updateLabels(labels);
  }

  @override
  void updatePremiumStatus(bool hasPremium) {
    routesFiltersPageCubit.updatePremiumStatus(hasPremium);
  }

  @override
  void updateCacheProgress({
    required double cacheProgress,
    required bool isCompleted,
  }) {
    homePageCubit.updateIsCompleted(isCompleted);
    routeCacheProgressViewCubit.updateProgress(cacheProgress);
  }
}
