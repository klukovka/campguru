import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiLocationsRepository implements LocationsRepository {
  final Dio client;

  ApiLocationsRepository(this.client);

  @override
  Future<FailureOrResult<void>> addLocationToFavorites(int id) {
    // TODO: implement addLocationToFavorites
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(Filter filter) {
    // TODO: implement getAllLocations
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getFavoriteLocations(Filter filter) {
    // TODO: implement getFavoriteLocations
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Location>> getLocationDetails(int id) {
    // TODO: implement getLocationDetails
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getLocationsFilterLabels() {
    // TODO: implement getLocationsFilterLabels
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getRouteLocations(
      int routeId, Filter filter) {
    // TODO: implement getRouteLocations
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<void>> removeLocationFromFavorites(int id) {
    // TODO: implement removeLocationFromFavorites
    throw UnimplementedError();
  }
}
