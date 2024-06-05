import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class SettingsPresenter implements SettingsOutputPort {
  final ProfileTabCubit profileTabCubit;
  final AppControlCubit appControlCubit;

  SettingsPresenter({
    required this.profileTabCubit,
    required this.appControlCubit,
  });

  @override
  void updateAppVerison(String version) {
    profileTabCubit.updateVersion(version);
  }

  @override
  void updateLanguageCode(String languageCode) {
    appControlCubit.setLanguageCode(languageCode);
  }
}
