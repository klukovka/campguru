import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RoutesRepositoryModule {
  @test
  @lazySingleton
  RoutesRepository getTestRoutesRepository(TestDataSource dataSource) =>
      TestRoutesRepository(
        dataSource,
      );
}
