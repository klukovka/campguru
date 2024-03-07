import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class AutoRouterModule {
  @singleton
  AppAutoRouter get appAutoRouter => AppAutoRouter();

  @singleton
  CampguruRouter router(AppAutoRouter stackRouter) => CampguruRouter(
        stackRouter,
      );
}
