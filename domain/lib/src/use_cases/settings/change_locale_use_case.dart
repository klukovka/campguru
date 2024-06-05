import 'package:domain/domain.dart';

class ChangeLocaleUseCase {
  final PreferencesRepository preferencesRepository;
  final SettingsOutputPort settingsOutputPort;

  ChangeLocaleUseCase({
    required this.preferencesRepository,
    required this.settingsOutputPort,
  });

  Future<void> call(String languageCode) async {
    await preferencesRepository.setLanguageCode(languageCode);
    settingsOutputPort.updateLanguageCode(languageCode);
  }
}
