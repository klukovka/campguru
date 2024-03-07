import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class AutoRouterModule {
  @lazySingleton
  AppAutoRouter getAppAutoRouter() => AppAutoRouter();

  @lazySingleton
  CampguruRouter router(AppAutoRouter stackRouter) => CampguruRouter(
        stackRouter,
      );
}
