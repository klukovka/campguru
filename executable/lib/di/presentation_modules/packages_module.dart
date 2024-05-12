import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class PackagesModule {
  @preResolve
  @singleton
  Future<PackageInfo> packageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}
