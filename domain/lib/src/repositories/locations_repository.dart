import 'package:domain/domain.dart';

abstract class LocationsRepository {
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(Filter filter);
  Future<FailureOrResult<void>> addLocationToFavorites(int id);
  Future<FailureOrResult<void>> removeLocationFromFavorites(int id);
  Future<FailureOrResult<Location>> getLocationDetails(int id);
  Future<FailureOrResult<Chunk<Location>>> getRouteLocations(
      int routeId, Filter filter);
  Future<FailureOrResult<List<LocationFilterLabel>>> getLocationsFilterLabels();
}
