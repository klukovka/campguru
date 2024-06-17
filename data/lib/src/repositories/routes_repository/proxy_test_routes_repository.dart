import 'package:data/data.dart';
import 'package:data/src/core/proxy_test_repository.dart';
import 'package:data/src/repositories/routes_repository/test_routes_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ProxyTestRoutesRepository extends ProxyTestRepository
    implements RoutesRepository {
  final TestRoutesRepository testRoutesRepository;
  final ApiRoutesRepository apiRoutesRepository;

  ProxyTestRoutesRepository(TestDataSource testDataSource, Dio client)
      : testRoutesRepository = TestRoutesRepository(testDataSource),
        apiRoutesRepository = ApiRoutesRepository(client);

  @override
  Future<FailureOrResult<void>> addRouteToFavorites(int id) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiRoutesRepository.addRouteToFavorites(id),
      testRequest: () async =>
          await testRoutesRepository.addRouteToFavorites(id),
    );
  }

  @override
  Future<FailureOrResult<Route>> createRoute(NewRoute newRoute) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiRoutesRepository.createRoute(newRoute),
      testRequest: () async => await testRoutesRepository.createRoute(newRoute),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getAllRoutes(Filter filter) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiRoutesRepository.getAllRoutes(filter),
      testRequest: () async => await testRoutesRepository.getAllRoutes(filter),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getFavoriteRoutes(Filter filter) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiRoutesRepository.getFavoriteRoutes(filter),
      testRequest: () async =>
          await testRoutesRepository.getFavoriteRoutes(filter),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getMyOwnRoutes(Filter filter) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiRoutesRepository.getMyOwnRoutes(filter),
      testRequest: () async =>
          await testRoutesRepository.getMyOwnRoutes(filter),
    );
  }

  @override
  Future<FailureOrResult<Route>> getRouteDetails(int id) async {
    return await makeSafeRequest(
      apiRequest: () async => await apiRoutesRepository.getRouteDetails(id),
      testRequest: () async => await testRoutesRepository.getRouteDetails(id),
    );
  }

  @override
  Future<FailureOrResult<RoutePreview>> getRoutePreview(
      List<int> locations) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiRoutesRepository.getRoutePreview(locations),
      testRequest: () async =>
          await testRoutesRepository.getRoutePreview(locations),
    );
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getRoutesFilterLabels() async {
    return await makeSafeRequest(
      apiRequest: () async => await apiRoutesRepository.getRoutesFilterLabels(),
      testRequest: () async =>
          await testRoutesRepository.getRoutesFilterLabels(),
    );
  }

  @override
  Future<FailureOrResult<void>> removeRouteFromFavorites(int id) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiRoutesRepository.removeRouteFromFavorites(id),
      testRequest: () async =>
          await testRoutesRepository.removeRouteFromFavorites(id),
    );
  }
}
