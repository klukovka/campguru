import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class SettingsPresenter implements SettingsOutputPort {
  final ProfileTabCubit profileTabCubit;

  SettingsPresenter({
    required this.profileTabCubit,
  });

  @override
  void updateAppVerison(String version) {
    profileTabCubit.updateVersion(version);
  }
}
