import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataSourceModule {
  @lazySingleton
  @preResolve
  Future<HiveDataSource> getHiveDataSource() async =>
      await HiveDataSource.getInstance();
}
