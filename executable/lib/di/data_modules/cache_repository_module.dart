import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CacheRepositoryModule {
  @lazySingleton
  @preResolve
  Future<CacheRepository> getCacheRepository(HiveDataSource dataSource) =>
      CacheFlutterMapRepository.getInstance(dataSource);
}
