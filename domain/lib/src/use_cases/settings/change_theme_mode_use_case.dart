import 'package:domain/domain.dart';

class ChangeThemeModeUseCase {
  final PreferencesRepository preferencesRepository;
  final SettingsOutputPort settingsOutputPort;

  ChangeThemeModeUseCase({
    required this.preferencesRepository,
    required this.settingsOutputPort,
  });

  Future<void> call(String themeMode) async {
    await preferencesRepository.setThemeMode(themeMode);
    settingsOutputPort.updateThemeMode(themeMode);
  }
}
