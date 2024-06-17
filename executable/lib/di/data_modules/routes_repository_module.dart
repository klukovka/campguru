import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RoutesRepositoryModule {
  @test
  @lazySingleton
  RoutesRepository getTestRoutesRepository(
    TestDataSource dataSource,
    Dio dio,
  ) =>
      ProxyTestRoutesRepository(dataSource, dio);

  @dev
  @prod
  @lazySingleton
  RoutesRepository getApiRoutesRepository(Dio dio) => ApiRoutesRepository(dio);
}
