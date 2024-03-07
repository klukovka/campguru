import 'package:executable/di/di.config.dart';
import 'package:executable/di/locator.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies(String env) async {
  await $configureDependencies(locator, environment: env);
}
