import 'package:domain/src/output_ports/settings_output_port.dart';
import 'package:domain/src/repositories/app_settings_repository.dart';

class GetAppVersion {
  final AppSettingsRepository appSettingsRepository;
  final SettingsOutputPort settingsOutputPort;

  GetAppVersion({
    required this.appSettingsRepository,
    required this.settingsOutputPort,
  });

  void call() {
    final version = appSettingsRepository.getVersion();
    settingsOutputPort.updateAppVerison(version);
  }
}
