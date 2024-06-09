import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class RoutesPresenter extends RoutesOutputPort {
  final RoutesTabCubit routesTabCubit;
  final RouteDetailsPageCubit routeDetailsPageCubit;
  final RoutesFiltersPageCubit routesFiltersPageCubit;
  final HomePageCubit homePageCubit;
  final RouteCacheProgressViewCubit routeCacheProgressViewCubit;
  final RouteMapPageCubit routeMapPageCubit;
  final CreateRoutePageCubit createRoutePageCubit;
  final FavoriteRoutesTabCubit favoriteRoutesTabCubit;
  final MyOwnRoutesTabCubit myOwnRoutesTabCubit;
  final CachedRoutesTabCubit cachedRoutesTabCubit;
  final CachedRouteDetailsPageCubit cachedRouteDetailsPageCubit;
  final CachedRouteMapPageCubit cachedRouteMapPageCubit;

  RoutesPresenter({
    required this.routesTabCubit,
    required this.routeDetailsPageCubit,
    required this.routesFiltersPageCubit,
    required this.homePageCubit,
    required this.routeCacheProgressViewCubit,
    required this.routeMapPageCubit,
    required this.createRoutePageCubit,
    required this.favoriteRoutesTabCubit,
    required this.myOwnRoutesTabCubit,
    required this.cachedRoutesTabCubit,
    required this.cachedRouteDetailsPageCubit,
    required this.cachedRouteMapPageCubit,
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

    final favoriteRoutes =
        favoriteRoutesTabCubit.state.routes.updateFavoriteStatus(
      routeId,
      isFavorite,
    );

    final myOwnRoutes = myOwnRoutesTabCubit.state.routes.updateFavoriteStatus(
      routeId,
      isFavorite,
    );

    routesTabCubit.setRoutes(allRoutes);
    favoriteRoutesTabCubit.setRoutes(favoriteRoutes);
    myOwnRoutesTabCubit.setRoutes(myOwnRoutes);

    if (routeDetailsPageCubit.state.route.id == routeId) {
      routeDetailsPageCubit.updateRouteFavoriteStatus(
        isFavorite,
      );
      routeMapPageCubit.updateRouteFavoriteStatus(
        isFavorite,
      );
    }
  }

  @override
  void updateRouteDetails(Route route) {
    final allRoutes = routesTabCubit.state.routes.merge(route);

    routesTabCubit.setRoutes(allRoutes);
    routeDetailsPageCubit.updateRoute(route);
    routeMapPageCubit.updateRoute(route);
  }

  @override
  void startRouteDetailsLoading() {
    routeDetailsPageCubit.startLoading();
    routeMapPageCubit.startLoading();
  }

  @override
  void updateRouteDetailsBriefly(int routeId) {
    final route = routesTabCubit.state.routes.firstWhereOrNull(
      (route) => route.id == routeId,
    );

    if (route != null) {
      routeDetailsPageCubit.updateRoute(route);
      routeMapPageCubit.updateRoute(route);
    } else {
      routeDetailsPageCubit.setHasError();
      routeMapPageCubit.setHasError();
    }
  }

  @override
  void updateRoutesAvailableFilters(List<PremiumBasedFilterLabel> labels) {
    routesFiltersPageCubit.updateLabels(labels);
    createRoutePageCubit.updateAvailableLabels(labels);
  }

  @override
  void updateCacheProgress({
    required double cacheProgress,
    required bool isCompleted,
  }) {
    homePageCubit.updateIsCompleted(isCompleted);
    routeCacheProgressViewCubit.updateProgress(cacheProgress);
  }

  @override
  void startPreviewLoading() {
    createRoutePageCubit.startPreviewLoading();
  }

  @override
  void startRouteCreation() {
    createRoutePageCubit.startRouteCreation();
  }

  @override
  void stopPreviewLoading() {
    createRoutePageCubit.stopPreviewLoading();
  }

  @override
  void stopRouteCreation({required bool hasError, int? routeId}) {
    createRoutePageCubit.stopRouteCreation(
      hasError: hasError,
      routeId: routeId,
    );
  }

  @override
  void updateRoutePreview(String url) {
    createRoutePageCubit.updatePreview(url);
  }

  @override
  void setFavoriteRoutesFilter(Filter filter) {
    favoriteRoutesTabCubit.setFilter(filter);
  }

  @override
  void stopFavoriteRoutesLoading() {
    favoriteRoutesTabCubit.stopLoading();
  }

  @override
  void updateFavoriteRoutes(List<Route> routes, int fullCount) {
    favoriteRoutesTabCubit.setRoutes(routes, amount: fullCount);
  }

  @override
  void setMyOwnRoutesFilter(Filter filter) {
    myOwnRoutesTabCubit.setFilter(filter);
  }

  @override
  void stopMyOwnRoutesLoading() {
    myOwnRoutesTabCubit.stopLoading();
  }

  @override
  void updateMyOwnRoutes(List<Route> routes, int fullCount) {
    myOwnRoutesTabCubit.setRoutes(routes, amount: fullCount);
  }

  @override
  void setCachedRoutesSearchQuery(String searchQuery) {
    cachedRoutesTabCubit.setSearchQuery(searchQuery);
  }

  @override
  void updateCachedRoutes(List<Route> routes) {
    cachedRoutesTabCubit.setRoutes(routes);
  }

  @override
  void deleteCachedRoute(int routeId) {
    final routes = cachedRoutesTabCubit.state.routes
        .where((element) => element.id != routeId)
        .toList();
    cachedRoutesTabCubit.setRoutes(routes);
  }

  @override
  void updateCachedRouteDetails(Route route) {
    cachedRouteDetailsPageCubit.updateRoute(route);
    cachedRouteMapPageCubit.updateRoute(route);
  }
}
