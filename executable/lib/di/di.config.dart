// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:presentation/presentation.dart' as _i3;

import 'presentation_modules/auto_router_module.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final autoRouterModule = _$AutoRouterModule();
  gh.singleton<_i3.AppAutoRouter>(autoRouterModule.appAutoRouter);
  gh.singleton<_i3.CampguruRouter>(
      autoRouterModule.router(gh<_i3.AppAutoRouter>()));
  return getIt;
}

class _$AutoRouterModule extends _i4.AutoRouterModule {}
