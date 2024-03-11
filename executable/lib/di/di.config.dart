// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i5;
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:presentation/presentation.dart' as _i3;

import 'data_modules/auth_repository_module.dart' as _i7;
import 'data_modules/data_source_module.dart' as _i9;
import 'data_modules/locations_repository_module.dart' as _i11;
import 'data_modules/preferences_repository_module.dart' as _i12;
import 'data_modules/users_repository_module.dart' as _i13;
import 'domain_modules/use_cases_module.dart' as _i14;
import 'presentation_modules/auto_router_module.dart' as _i6;
import 'presentation_modules/bloc_module.dart' as _i10;
import 'presentation_modules/controllers_module.dart' as _i15;
import 'presentation_modules/presenters_module.dart' as _i8;

const String _test = 'test';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final autoRouterModule = _$AutoRouterModule();
  final authRepositoryModule = _$AuthRepositoryModule();
  final presentersModule = _$PresentersModule();
  final dataSourceModule = _$DataSourceModule();
  final blocModule = _$BlocModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
  final useCasesModule = _$UseCasesModule();
  final controllersModule = _$ControllersModule();
  gh.lazySingleton<_i3.AppAutoRouter>(
      () => autoRouterModule.getAppAutoRouter());
  gh.lazySingleton<_i4.AuthRepository>(
    () => authRepositoryModule.testAuthRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.CampguruRouter>(
      () => autoRouterModule.router(gh<_i3.AppAutoRouter>()));
  gh.lazySingleton<_i4.ErrorHandlerOutputPort>(
      () => presentersModule.getErrorHandlerOutputPort());
  await gh.lazySingletonAsync<_i5.HiveDataSource>(
    () => dataSourceModule.hiveDataSource,
    preResolve: true,
  );
  gh.lazySingleton<_i3.HomePageCubit>(() => blocModule.homePageCubit);
  gh.lazySingleton<_i4.LocationsRepository>(
    () => locationsRepositoryModule.testLocationsRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.LocationsTabCubit>(() => blocModule.locationsTabCubit);
  gh.lazySingleton<_i4.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i5.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.SplashPageCubit>(() => blocModule.splashPageCubit);
  gh.lazySingleton<_i4.UsersRepository>(
    () => usersRepositoryModule.testUsersRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.CurrentUserOutputPort>(
      () => presentersModule.getCurrentUserOutputPort(
            gh<_i3.SplashPageCubit>(),
            gh<_i3.HomePageCubit>(),
          ));
  gh.lazySingleton<_i4.IsAuthorizedUseCase>(
      () => useCasesModule.getIsAuthorizedUseCase(
            gh<_i4.PreferencesRepository>(),
            gh<_i4.AuthRepository>(),
            gh<_i4.UsersRepository>(),
            gh<_i4.CurrentUserOutputPort>(),
            gh<_i4.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i4.LocationsOutputPort>(() =>
      presentersModule.getLocationsOutputPort(gh<_i3.LocationsTabCubit>()));
  gh.lazySingleton<_i4.GetAllLocationsUseCase>(
      () => useCasesModule.getAllLocationsUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i3.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i4.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i3.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i4.IsAuthorizedUseCase>(),
            gh<_i4.GetAllLocationsUseCase>(),
          ));
  return getIt;
}

class _$AutoRouterModule extends _i6.AutoRouterModule {}

class _$AuthRepositoryModule extends _i7.AuthRepositoryModule {}

class _$PresentersModule extends _i8.PresentersModule {}

class _$DataSourceModule extends _i9.DataSourceModule {}

class _$BlocModule extends _i10.BlocModule {}

class _$LocationsRepositoryModule extends _i11.LocationsRepositoryModule {}

class _$PreferencesRepositoryModule extends _i12.PreferencesRepositoryModule {}

class _$UsersRepositoryModule extends _i13.UsersRepositoryModule {}

class _$UseCasesModule extends _i14.UseCasesModule {}

class _$ControllersModule extends _i15.ControllersModule {}
