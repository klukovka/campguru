import 'package:domain/domain.dart';

abstract class LocationsRepository {
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(Filter filter);
}
