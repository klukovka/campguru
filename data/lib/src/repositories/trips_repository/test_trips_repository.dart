import 'package:data/data.dart';
import 'package:domain/domain.dart';

class TestTripsRepository implements TripsRepository {
  final TestDataSource _dataSource;

  TestTripsRepository(this._dataSource);

  @override
  Future<FailureOrResult<Trip>> getTripDetails(int id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final trip = await _dataSource.getTripDetails(id);
    return FailureOrResult.success(trip);
  }

  @override
  Future<FailureOrResult<Chunk<Trip>>> getTrips(Filter filter) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      _dataSource.generateTrips(
        size: filter.size,
        page: filter.page,
      ),
    );
  }

  @override
  Future<FailureOrResult<Trip>> completeTrip(int id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final trip = await _dataSource.getTripDetails(id);
    return FailureOrResult.success(trip.copyWith(
      completed: true,
    ));
  }

  @override
  Future<FailureOrResult<Trip>> createNewTrip(NewTrip newTrip) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return FailureOrResult.success(
      Trip(
        id: 32334,
        name: newTrip.title,
        date: newTrip.date,
        completed: false,
        route: newTrip.route,
        users: newTrip.users,
        usersAmount: newTrip.users.length,
      ),
    );
  }
}
