import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocationsRepositoryModule {
  @test
  @lazySingleton
  LocationsRepository getTestLocationsRepository(TestDataSource dataSource) =>
      TestLocationsRepository(
        dataSource,
      );
}
