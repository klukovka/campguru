import 'package:data/data.dart';
import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/models/users/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class TestTripsRepository implements TripsRepository {
  final TestDataSource _dataSource;
  final Dio client;

  TestTripsRepository(
    this._dataSource,
    this.client,
  );

  @override
  Future<FailureOrResult<Trip>> getTripDetails(int id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final trip = await _dataSource.getTripDetails(0);
    final user1 = (await client.get('/api/user/email/emma.stone@gmail.com'))
        .toFailureOrResult(UserDto.fromJson);
    final user2 = (await client.get('/api/user/email/ryan.gosling@gmail.com'))
        .toFailureOrResult(UserDto.fromJson);
    final user3 = (await client.get('/api/user/email/noah.sebastian@gmail.com'))
        .toFailureOrResult(UserDto.fromJson);
    final user4 = (await client.get('/api/user/email/oliver.sykes@gmail.com'))
        .toFailureOrResult(UserDto.fromJson);
    final currentUser = (await client.get('/auth/current-user'))
        .toFailureOrResult(UserDto.fromJson);
    final users = [
      if (currentUser.wasSuccessful) currentUser.result!,
      if (user1.wasSuccessful) user1.result!,
      if (user2.wasSuccessful) user2.result!,
      if (user3.wasSuccessful) user3.result!,
      if (user4.wasSuccessful) user4.result!,
    ];
    return FailureOrResult.success(
      trip.copyWith(users: users, usersAmount: users.length),
    );
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
        id: 0,
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
