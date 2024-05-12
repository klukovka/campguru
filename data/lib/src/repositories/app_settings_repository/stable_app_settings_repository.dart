import 'package:domain/domain.dart';
import 'package:package_info_plus/package_info_plus.dart';

class StableAppSettingsRepository implements AppSettingsRepository {
  final PackageInfo packageInfo;

  StableAppSettingsRepository({required this.packageInfo});

  @override
  String getVersion() {
    return '${packageInfo.version}+${packageInfo.buildNumber}';
  }
}
