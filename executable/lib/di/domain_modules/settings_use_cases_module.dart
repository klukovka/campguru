import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SettingsUseCasesModule {
  @lazySingleton
  GetAppVersion getAppVersion(
    AppSettingsRepository appSettingsRepository,
    SettingsOutputPort settingsOutputPort,
  ) =>
      GetAppVersion(
        appSettingsRepository: appSettingsRepository,
        settingsOutputPort: settingsOutputPort,
      );
}
