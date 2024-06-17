import 'package:domain/domain.dart';

abstract class RoutesRepository {
  Future<FailureOrResult<Chunk<Route>>> getAllRoutes(Filter filter);
  Future<FailureOrResult<void>> addRouteToFavorites(int id);
  Future<FailureOrResult<void>> removeRouteFromFavorites(int id);
  Future<FailureOrResult<Route>> getRouteDetails(int id);
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getRoutesFilterLabels();
  Future<FailureOrResult<Route>> createRoute(NewRoute newRoute);
  Future<FailureOrResult<RoutePreview>> getRoutePreview(List<int> locations);
  Future<FailureOrResult<Chunk<Route>>> getFavoriteRoutes(Filter filter);
  Future<FailureOrResult<Chunk<Route>>> getMyOwnRoutes(Filter filter);
}
