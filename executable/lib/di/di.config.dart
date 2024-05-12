// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i6;
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i3;
import 'package:presentation/presentation.dart' as _i5;

import 'data_modules/app_settings_repository_module.dart' as _i14;
import 'data_modules/auth_repository_module.dart' as _i13;
import 'data_modules/data_source_module.dart' as _i11;
import 'data_modules/locations_repository_module.dart' as _i16;
import 'data_modules/preferences_repository_module.dart' as _i15;
import 'data_modules/reviews_repository_module.dart' as _i18;
import 'data_modules/routes_repository_module.dart' as _i17;
import 'data_modules/users_repository_module.dart' as _i12;
import 'domain_modules/location_use_cases_module.dart' as _i21;
import 'domain_modules/review_use_cases_module.dart' as _i20;
import 'domain_modules/route_use_cases_module.dart' as _i24;
import 'domain_modules/settings_use_cases_module.dart' as _i23;
import 'domain_modules/user_use_cases_module.dart' as _i19;
import 'presentation_modules/auto_router_module.dart' as _i9;
import 'presentation_modules/bloc_module.dart' as _i10;
import 'presentation_modules/controllers_module.dart' as _i22;
import 'presentation_modules/packages_module.dart' as _i7;
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
  final packagesModule = _$PackagesModule();
  final presentersModule = _$PresentersModule();
  final autoRouterModule = _$AutoRouterModule();
  final blocModule = _$BlocModule();
  final dataSourceModule = _$DataSourceModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
  final authRepositoryModule = _$AuthRepositoryModule();
  final appSettingsRepositoryModule = _$AppSettingsRepositoryModule();
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final routesRepositoryModule = _$RoutesRepositoryModule();
  final reviewsRepositoryModule = _$ReviewsRepositoryModule();
  final userUseCasesModule = _$UserUseCasesModule();
  final reviewUseCasesModule = _$ReviewUseCasesModule();
  final locationUseCasesCasesModule = _$LocationUseCasesCasesModule();
  final controllersModule = _$ControllersModule();
  final settingsUseCasesModule = _$SettingsUseCasesModule();
  final routeUseCasesModule = _$RouteUseCasesModule();
  await gh.singletonAsync<_i3.PackageInfo>(
    () => packagesModule.packageInfo(),
    preResolve: true,
  );
  gh.lazySingleton<_i4.ErrorHandlerOutputPort>(
      () => presentersModule.getErrorHandlerOutputPort());
  gh.lazySingleton<_i5.AppAutoRouter>(
      () => autoRouterModule.getAppAutoRouter());
  gh.lazySingleton<_i5.SplashPageCubit>(() => blocModule.splashPageCubit);
  gh.lazySingleton<_i5.HomePageCubit>(() => blocModule.homePageCubit);
  gh.lazySingleton<_i5.LocationsTabCubit>(() => blocModule.locationsTabCubit);
  gh.lazySingleton<_i5.LocationDetailsPageCubit>(
      () => blocModule.locationDetailsPageCubit);
  gh.lazySingleton<_i5.LocationReviewsPageCubit>(
      () => blocModule.locationReviewsPageCubit);
  gh.lazySingleton<_i5.RoutesTabCubit>(() => blocModule.routesTabCubit);
  gh.lazySingleton<_i5.RouteDetailsPageCubit>(
      () => blocModule.routeDetailsPageCubit);
  gh.lazySingleton<_i5.RouteLocationsPageCubit>(
      () => blocModule.routeLocationsPageCubit);
  gh.lazySingleton<_i5.RouteReviewsPageCubit>(
      () => blocModule.routeReviewsPageCubit);
  gh.lazySingleton<_i5.LocationsFiltersPageCubit>(
      () => blocModule.locationsFiltersPageCubit);
  gh.lazySingleton<_i5.RoutesFiltersPageCubit>(
      () => blocModule.routesFiltersPageCubit);
  gh.lazySingleton<_i5.ProfileTabCubit>(() => blocModule.profileTabCubit);
  await gh.lazySingletonAsync<_i6.HiveDataSource>(
    () => dataSourceModule.hiveDataSource,
    preResolve: true,
  );
  gh.lazySingleton<_i4.RoutesOutputPort>(
      () => presentersModule.getRoutesOutputPort(
            gh<_i5.RoutesTabCubit>(),
            gh<_i5.RouteDetailsPageCubit>(),
            gh<_i5.RoutesFiltersPageCubit>(),
          ));
  gh.lazySingleton<_i5.CampguruRouter>(
      () => autoRouterModule.router(gh<_i5.AppAutoRouter>()));
  gh.lazySingleton<_i4.LocationsOutputPort>(
      () => presentersModule.getLocationsOutputPort(
            gh<_i5.LocationsTabCubit>(),
            gh<_i5.LocationDetailsPageCubit>(),
            gh<_i5.RouteLocationsPageCubit>(),
            gh<_i5.LocationsFiltersPageCubit>(),
          ));
  gh.lazySingleton<_i4.UsersRepository>(
    () => usersRepositoryModule.testUsersRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i6.TestDataSource>(
    () => dataSourceModule.testDataSource,
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.AuthRepository>(
    () => authRepositoryModule.testAuthRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.ReviewsOutputPort>(
      () => presentersModule.getReviewsOutputPort(
            gh<_i5.LocationReviewsPageCubit>(),
            gh<_i5.RouteReviewsPageCubit>(),
          ));
  gh.lazySingleton<_i4.CurrentUserOutputPort>(
      () => presentersModule.getCurrentUserOutputPort(
            gh<_i5.SplashPageCubit>(),
            gh<_i5.HomePageCubit>(),
            gh<_i5.ProfileTabCubit>(),
          ));
  gh.lazySingleton<_i4.AppSettingsRepository>(() => appSettingsRepositoryModule
      .getAppSettingsRepository(gh<_i3.PackageInfo>()));
  gh.lazySingleton<_i4.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i6.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.SettingsOutputPort>(
      () => presentersModule.getSettingsOutputPort(gh<_i5.ProfileTabCubit>()));
  gh.lazySingleton<_i4.LocationsRepository>(
    () => locationsRepositoryModule
        .getTestLocationsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.RoutesRepository>(
    () => routesRepositoryModule
        .getTestRoutesRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.ReviewsRepository>(
    () => reviewsRepositoryModule
        .getTestReviewsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.GetUserSubscriptionStatus>(
      () => userUseCasesModule.getUserSubscriptionStatus(
            gh<_i4.UsersRepository>(),
            gh<_i4.LocationsOutputPort>(),
            gh<_i4.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetLocationReviewsUseCase>(
      () => reviewUseCasesModule.getLocationReviewsUseCase(
            gh<_i4.ReviewsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetRouteReviewsUseCase>(
      () => reviewUseCasesModule.getRouteReviewsUseCase(
            gh<_i4.ReviewsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.ReviewsOutputPort>(),
          ));
  gh.factory<_i4.GetLocationsAvailableFiltersUseCase>(
      () => locationUseCasesCasesModule.getLocationsAvailableFiltersUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetAllLocationsUseCase>(
      () => locationUseCasesCasesModule.getAllLocationsUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.UpdateLocationFavoriteStatusUseCase>(
      () => locationUseCasesCasesModule.getUpdateLocationFavoriteStatusUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetLocationDetailsUseCase>(
      () => locationUseCasesCasesModule.getLocationDetailsUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetRouteLocationsUseCase>(
      () => locationUseCasesCasesModule.getRouteLocationsUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.IsAuthorizedUseCase>(
      () => userUseCasesModule.getIsAuthorizedUseCase(
            gh<_i4.PreferencesRepository>(),
            gh<_i4.AuthRepository>(),
            gh<_i4.UsersRepository>(),
            gh<_i4.CurrentUserOutputPort>(),
            gh<_i4.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.LocationDetailsPageController>(() => controllersModule
      .getLocationDetailsPageController(gh<_i4.GetLocationDetailsUseCase>()));
  gh.lazySingleton<_i5.LocationFavoriteButtonController>(() =>
      controllersModule.getLocationFavoriteButtonController(
          gh<_i4.UpdateLocationFavoriteStatusUseCase>()));
  gh.lazySingleton<_i5.LocationReviewsPageController>(() => controllersModule
      .getLocationReviewsPageController(gh<_i4.GetLocationReviewsUseCase>()));
  gh.lazySingleton<_i5.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i4.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i5.LocationFiltersPageController>(() => controllersModule
      .getLocationFiltersPageController(gh<_i4.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i5.RouteReviewsPageController>(() => controllersModule
      .getRouteReviewsPageController(gh<_i4.GetRouteReviewsUseCase>()));
  gh.lazySingleton<_i4.GetAppVersion>(
      () => settingsUseCasesModule.getAppVersion(
            gh<_i4.AppSettingsRepository>(),
            gh<_i4.SettingsOutputPort>(),
          ));
  gh.factory<_i4.GetRoutesAvailableFiltersUseCase>(
      () => routeUseCasesModule.getRoutesAvailableFiltersUseCase(
            gh<_i4.RoutesRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetAllRoutesUseCase>(
      () => routeUseCasesModule.getAllRoutesUseCase(
            gh<_i4.RoutesRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i4.UpdateRouteFavoriteStatusUseCase>(
      () => routeUseCasesModule.getUpdateRouteFavoriteStatusUseCase(
            gh<_i4.RoutesRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetRouteDetailsUseCase>(
      () => routeUseCasesModule.getRouteDetailsUseCase(
            gh<_i4.RoutesRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteLocationsPageController>(() => controllersModule
      .getRouteLocationsController(gh<_i4.GetRouteLocationsUseCase>()));
  gh.lazySingleton<_i5.RouteDetailsPageController>(() => controllersModule
      .getRouteDetailsPageController(gh<_i4.GetRouteDetailsUseCase>()));
  gh.lazySingleton<_i5.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i4.IsAuthorizedUseCase>(),
            gh<_i4.GetAllLocationsUseCase>(),
            gh<_i4.GetAllRoutesUseCase>(),
            gh<_i4.GetLocationsAvailableFiltersUseCase>(),
            gh<_i4.GetRoutesAvailableFiltersUseCase>(),
            gh<_i4.GetAppVersion>(),
          ));
  gh.lazySingleton<_i5.RoutesTabController>(() =>
      controllersModule.getRoutesTabController(gh<_i4.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFiltersPageController>(() => controllersModule
      .getRouteFiltersPageController(gh<_i4.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFavoriteButtonController>(() =>
      controllersModule.getRouteFavoriteButtonController(
          gh<_i4.UpdateRouteFavoriteStatusUseCase>()));
  return getIt;
}

class _$PackagesModule extends _i7.PackagesModule {}

class _$PresentersModule extends _i8.PresentersModule {}

class _$AutoRouterModule extends _i9.AutoRouterModule {}

class _$BlocModule extends _i10.BlocModule {}

class _$DataSourceModule extends _i11.DataSourceModule {}

class _$UsersRepositoryModule extends _i12.UsersRepositoryModule {}

class _$AuthRepositoryModule extends _i13.AuthRepositoryModule {}

class _$AppSettingsRepositoryModule extends _i14.AppSettingsRepositoryModule {}

class _$PreferencesRepositoryModule extends _i15.PreferencesRepositoryModule {}

class _$LocationsRepositoryModule extends _i16.LocationsRepositoryModule {}

class _$RoutesRepositoryModule extends _i17.RoutesRepositoryModule {}

class _$ReviewsRepositoryModule extends _i18.ReviewsRepositoryModule {}

class _$UserUseCasesModule extends _i19.UserUseCasesModule {}

class _$ReviewUseCasesModule extends _i20.ReviewUseCasesModule {}

class _$LocationUseCasesCasesModule extends _i21.LocationUseCasesCasesModule {}

class _$ControllersModule extends _i22.ControllersModule {}

class _$SettingsUseCasesModule extends _i23.SettingsUseCasesModule {}

class _$RouteUseCasesModule extends _i24.RouteUseCasesModule {}
