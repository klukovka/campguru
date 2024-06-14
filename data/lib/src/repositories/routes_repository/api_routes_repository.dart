import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiRoutesRepository implements RoutesRepository {
  final Dio client;

  ApiRoutesRepository(this.client);

  @override
  Future<FailureOrResult<void>> addRouteToFavorites(int id) {
    // TODO: implement addRouteToFavorites
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Route>> createRoute(NewRoute newRoute) {
    // TODO: implement createRoute
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getAllRoutes(Filter filter) {
    // TODO: implement getAllRoutes
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getFavoriteRoutes(Filter filter) {
    // TODO: implement getFavoriteRoutes
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getMyOwnRoutes(Filter filter) {
    // TODO: implement getMyOwnRoutes
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Route>> getRouteDetails(int id) {
    // TODO: implement getRouteDetails
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<String>> getRoutePreview(List<int> locations) {
    // TODO: implement getRoutePreview
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getRoutesFilterLabels() {
    // TODO: implement getRoutesFilterLabels
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<void>> removeRouteFromFavorites(int id) {
    // TODO: implement removeRouteFromFavorites
    throw UnimplementedError();
  }
}
