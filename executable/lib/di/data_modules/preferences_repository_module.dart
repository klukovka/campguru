import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PreferencesRepositoryModule {
  @test
  @lazySingleton
  PreferencesRepository testPreferencesRepository(HiveDataSource dataSource) =>
      TestPreferencesRepository(dataSource);
}
