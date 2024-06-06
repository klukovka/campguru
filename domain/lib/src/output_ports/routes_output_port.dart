import 'package:domain/domain.dart';

abstract class RoutesOutputPort {
  void setAllRoutesFilter(Filter filter);
  void updateAllRoutes(List<Route> routes, int amount);
  void stopAllRoutesLoading();

  void updateRouteFavoriteStatus(int routeId, bool isFavorite);
  void startRouteDetailsLoading();
  void updateRouteDetails(Route route);
  void updateRouteDetailsBriefly(int routeId);

  void updateRoutesAvailableFilters(List<PremiumBasedFilterLabel> labels);

  void updateCacheProgress({
    required double cacheProgress,
    required bool isCompleted,
  });

  void startRouteCreation();
  void stopRouteCreation({required bool hasError, int? routeId});

  void startPreviewLoading();
  void updateRoutePreview(String url);
  void stopPreviewLoading();

  void setFavoriteRoutesFilter(Filter filter);
  void updateFavoriteRoutes(List<Route> routes, int fullCount);
  void stopFavoriteRoutesLoading();

  void setMyOwnRoutesFilter(Filter filter);
  void updateMyOwnRoutes(List<Route> routes, int fullCount);
  void stopMyOwnRoutesLoading();

  void setCachedRoutesSearchQuery(String searchQuery);
  void updateCachedRoutes(List<Route> routes);

  void deleteCachedRoute(int routeId);

  void updateCachedRouteDetails(Route route);
}
