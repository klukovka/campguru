import 'package:domain/domain.dart';

class GetInitialSettingsUseCase {
  final PreferencesRepository preferencesRepository;
  final SettingsOutputPort settingsOutputPort;

  GetInitialSettingsUseCase({
    required this.preferencesRepository,
    required this.settingsOutputPort,
  });

  void call() {
    settingsOutputPort
      ..updateLanguageCode(preferencesRepository.getLanguageCode())
      ..updateThemeMode(preferencesRepository.getThemeMode());
  }
}
