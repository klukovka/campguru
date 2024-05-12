import 'package:domain/domain.dart';

abstract class TripsRepository {
  Future<FailureOrResult<Chunk<Trip>>> getTrips(Filter filter);
  Future<FailureOrResult<Trip>> getTripDetails(int id);
  Future<FailureOrResult<Trip>> completeTrip(int id);
}
