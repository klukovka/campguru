import 'package:domain/domain.dart';

abstract class LocationsRepository {
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(Filter filter);
  Future<FailureOrResult<void>> addLocationToFavorites(int id);
  Future<FailureOrResult<void>> removeLocationFromFavorites(int id);
}
