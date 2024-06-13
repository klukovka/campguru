import 'package:data/data.dart';
import 'package:data/src/core/proxy_test_repository.dart';
import 'package:data/src/repositories/locations_repository/test_locations_repository.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ProxyTestLocationsRepository extends ProxyTestRepository
    implements LocationsRepository {
  final TestLocationsRepository testLocationsRepository;
  final ApiLocationsRepository apiLocationsRepository;

  ProxyTestLocationsRepository(TestDataSource testDataSource, Dio client)
      : testLocationsRepository = TestLocationsRepository(testDataSource),
        apiLocationsRepository = ApiLocationsRepository(client);

  @override
  Future<FailureOrResult<void>> addLocationToFavorites(int id) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiLocationsRepository.addLocationToFavorites(id),
      testRequest: () async =>
          await testLocationsRepository.addLocationToFavorites(id),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(
    Filter filter,
  ) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiLocationsRepository.getAllLocations(filter),
      testRequest: () async =>
          await testLocationsRepository.getAllLocations(filter),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getFavoriteLocations(
    Filter filter,
  ) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiLocationsRepository.getFavoriteLocations(filter),
      testRequest: () async =>
          await testLocationsRepository.getFavoriteLocations(filter),
    );
  }

  @override
  Future<FailureOrResult<Location>> getLocationDetails(int id) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiLocationsRepository.getLocationDetails(id),
      testRequest: () async =>
          await testLocationsRepository.getLocationDetails(id),
    );
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getLocationsFilterLabels() async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiLocationsRepository.getLocationsFilterLabels(),
      testRequest: () async =>
          await testLocationsRepository.getLocationsFilterLabels(),
    );
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getRouteLocations(
    int routeId,
    Filter filter,
  ) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiLocationsRepository.getRouteLocations(routeId, filter),
      testRequest: () async =>
          await testLocationsRepository.getRouteLocations(routeId, filter),
    );
  }

  @override
  Future<FailureOrResult<void>> removeLocationFromFavorites(int id) async {
    return await makeSafeRequest(
      apiRequest: () async =>
          await apiLocationsRepository.removeLocationFromFavorites(id),
      testRequest: () async =>
          await testLocationsRepository.removeLocationFromFavorites(id),
    );
  }
}
