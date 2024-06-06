import 'package:data/data.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataSourceModule {
  @lazySingleton
  @preResolve
  Future<HiveDataSource> getHiveDataSource() async =>
      await HiveDataSource.getInstance();

  @lazySingleton
  @test
  TestDataSource getTestDataSource(
    DeviceInfoPlugin deviceInfoPlugin,
  ) =>
      TestDataSource(deviceInfoPlugin);

  @lazySingleton
  SubscriptionsDataSource subscriptionsDataSource() =>
      SubscriptionsDataSource();
}
