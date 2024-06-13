import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocationsRepositoryModule {
  @test
  @lazySingleton
  LocationsRepository getTestLocationsRepository(
    TestDataSource dataSource,
    Dio dio,
  ) =>
      ProxyTestLocationsRepository(
        dataSource,
        dio,
      );

  @dev
  @prod
  @lazySingleton
  LocationsRepository getApiLocationsRepository(Dio dio) =>
      ApiLocationsRepository(dio);
}
