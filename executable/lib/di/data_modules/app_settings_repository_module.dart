import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class AppSettingsRepositoryModule {
  @lazySingleton
  AppSettingsRepository getAppSettingsRepository(PackageInfo packageInfo) =>
      StableAppSettingsRepository(
        packageInfo: packageInfo,
      );
}
