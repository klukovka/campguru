import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataSourceModule {
  @lazySingleton
  @preResolve
  Future<HiveDataSource> get hiveDataSource async =>
      await HiveDataSource.getInstance();
}
