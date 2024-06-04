import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class TripsRepositoryModule {
  @lazySingleton
  @test
  TripsRepository getTripsRepository(TestDataSource testDataSource, Dio dio) =>
      TestTripsRepository(testDataSource, dio);
}
