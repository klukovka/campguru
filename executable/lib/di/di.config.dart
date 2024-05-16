// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i7;
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:domain/domain.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:presentation/presentation.dart' as _i6;

import 'data_modules/app_settings_repository_module.dart' as _i15;
import 'data_modules/auth_repository_module.dart' as _i14;
import 'data_modules/cache_repository_module.dart' as _i17;
import 'data_modules/data_packages_module.dart' as _i8;
import 'data_modules/data_source_module.dart' as _i12;
import 'data_modules/geoposition_repository_module.dart' as _i13;
import 'data_modules/locations_repository_module.dart' as _i19;
import 'data_modules/preferences_repository_module.dart' as _i16;
import 'data_modules/reviews_repository_module.dart' as _i21;
import 'data_modules/routes_repository_module.dart' as _i20;
import 'data_modules/trips_repository_module.dart' as _i28;
import 'data_modules/users_repository_module.dart' as _i18;
import 'domain_modules/geoposition_use_cases_module.dart' as _i25;
import 'domain_modules/location_use_cases_module.dart' as _i26;
import 'domain_modules/review_use_cases_module.dart' as _i24;
import 'domain_modules/route_use_cases_module.dart' as _i22;
import 'domain_modules/settings_use_cases_module.dart' as _i29;
import 'domain_modules/trip_use_cases_module.dart' as _i30;
import 'domain_modules/user_use_cases_module.dart' as _i23;
import 'presentation_modules/auto_router_module.dart' as _i10;
import 'presentation_modules/bloc_module.dart' as _i11;
import 'presentation_modules/controllers_module.dart' as _i27;
import 'presentation_modules/presenters_module.dart' as _i9;

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
  final dataPackagesModule = _$DataPackagesModule();
  final presentersModule = _$PresentersModule();
  final autoRouterModule = _$AutoRouterModule();
  final blocModule = _$BlocModule();
  final dataSourceModule = _$DataSourceModule();
  final geopositionRepositoryModule = _$GeopositionRepositoryModule();
  final authRepositoryModule = _$AuthRepositoryModule();
  final appSettingsRepositoryModule = _$AppSettingsRepositoryModule();
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final cacheRepositoryModule = _$CacheRepositoryModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final routesRepositoryModule = _$RoutesRepositoryModule();
  final reviewsRepositoryModule = _$ReviewsRepositoryModule();
  final routeUseCasesModule = _$RouteUseCasesModule();
  final userUseCasesModule = _$UserUseCasesModule();
  final reviewUseCasesModule = _$ReviewUseCasesModule();
  final geopositionUseCasesModule = _$GeopositionUseCasesModule();
  final locationUseCasesCasesModule = _$LocationUseCasesCasesModule();
  final controllersModule = _$ControllersModule();
  final tripsRepositoryModule = _$TripsRepositoryModule();
  final settingsUseCasesModule = _$SettingsUseCasesModule();
  final tripUseCasesModule = _$TripUseCasesModule();
  gh.singleton<_i3.DeviceInfoPlugin>(() => dataPackagesModule.deviceInfoPlugin);
  await gh.singletonAsync<_i4.PackageInfo>(
    () => dataPackagesModule.packageInfo(),
    preResolve: true,
  );
  gh.lazySingleton<_i5.ErrorHandlerOutputPort>(
      () => presentersModule.getErrorHandlerOutputPort());
  gh.lazySingleton<_i6.AppAutoRouter>(
      () => autoRouterModule.getAppAutoRouter());
  gh.lazySingleton<_i6.SplashPageCubit>(() => blocModule.splashPageCubit);
  gh.lazySingleton<_i6.HomePageCubit>(() => blocModule.homePageCubit);
  gh.lazySingleton<_i6.LocationsTabCubit>(() => blocModule.locationsTabCubit);
  gh.lazySingleton<_i6.LocationDetailsPageCubit>(
      () => blocModule.locationDetailsPageCubit);
  gh.lazySingleton<_i6.LocationReviewsPageCubit>(
      () => blocModule.locationReviewsPageCubit);
  gh.lazySingleton<_i6.RoutesTabCubit>(() => blocModule.routesTabCubit);
  gh.lazySingleton<_i6.RouteDetailsPageCubit>(
      () => blocModule.routeDetailsPageCubit);
  gh.lazySingleton<_i6.RouteLocationsPageCubit>(
      () => blocModule.routeLocationsPageCubit);
  gh.lazySingleton<_i6.RouteReviewsPageCubit>(
      () => blocModule.routeReviewsPageCubit);
  gh.lazySingleton<_i6.LocationsFiltersPageCubit>(
      () => blocModule.locationsFiltersPageCubit);
  gh.lazySingleton<_i6.RoutesFiltersPageCubit>(
      () => blocModule.routesFiltersPageCubit);
  gh.lazySingleton<_i6.ProfileTabCubit>(() => blocModule.profileTabCubit);
  gh.lazySingleton<_i6.TripsTabCubit>(() => blocModule.tripsTabCubit);
  gh.lazySingleton<_i6.TripsFiltersPageCubit>(
      () => blocModule.tripsFiltersPageCubit);
  gh.lazySingleton<_i6.TripDetailsPageCubit>(
      () => blocModule.tripDetailsPageCubit);
  gh.lazySingleton<_i6.RouteCacheProgressViewCubit>(
      () => blocModule.routeCacheProgressViewCubit);
  gh.lazySingleton<_i6.RouteMapPageCubit>(() => blocModule.routeMapPageCubit);
  gh.lazySingleton<_i6.FavoriteLocationsPageCubit>(
      () => blocModule.favoriteLocationsPageCubit);
  gh.lazySingleton<_i6.CreateRoutePageCubit>(
      () => blocModule.createRoutePageCubit);
  gh.lazySingleton<_i6.FavoriteRoutesTabCubit>(
      () => blocModule.favoriteRoutesTabCubit);
  gh.lazySingleton<_i6.MyOwnRoutesTabCubit>(
      () => blocModule.myOwnRoutesTabCubit);
  gh.lazySingleton<_i6.CachedRoutesTabCubit>(
      () => blocModule.cachedRoutesTabCubit);
  await gh.lazySingletonAsync<_i7.HiveDataSource>(
    () => dataSourceModule.getHiveDataSource(),
    preResolve: true,
  );
  gh.lazySingleton<_i5.GeopositionRepository>(
      () => geopositionRepositoryModule.geopositionRepository);
  gh.lazySingleton<_i6.CampguruRouter>(
      () => autoRouterModule.router(gh<_i6.AppAutoRouter>()));
  gh.lazySingleton<_i5.RoutesOutputPort>(
      () => presentersModule.getRoutesOutputPort(
            gh<_i6.RoutesTabCubit>(),
            gh<_i6.RouteDetailsPageCubit>(),
            gh<_i6.RoutesFiltersPageCubit>(),
            gh<_i6.HomePageCubit>(),
            gh<_i6.RouteCacheProgressViewCubit>(),
            gh<_i6.RouteMapPageCubit>(),
            gh<_i6.CreateRoutePageCubit>(),
            gh<_i6.FavoriteRoutesTabCubit>(),
            gh<_i6.MyOwnRoutesTabCubit>(),
            gh<_i6.CachedRoutesTabCubit>(),
          ));
  gh.lazySingleton<_i5.TripsOutputPort>(
      () => presentersModule.getTripsOutputPort(
            gh<_i6.TripsTabCubit>(),
            gh<_i6.TripsFiltersPageCubit>(),
            gh<_i6.TripDetailsPageCubit>(),
          ));
  gh.lazySingleton<_i5.AuthRepository>(
    () => authRepositoryModule.testAuthRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.GeopositionOutputPort>(
      () => presentersModule.geopositionPresenter(gh<_i6.RouteMapPageCubit>()));
  gh.lazySingleton<_i5.ReviewsOutputPort>(
      () => presentersModule.getReviewsOutputPort(
            gh<_i6.LocationReviewsPageCubit>(),
            gh<_i6.RouteReviewsPageCubit>(),
          ));
  gh.lazySingleton<_i5.CurrentUserOutputPort>(
      () => presentersModule.getCurrentUserOutputPort(
            gh<_i6.SplashPageCubit>(),
            gh<_i6.HomePageCubit>(),
            gh<_i6.ProfileTabCubit>(),
          ));
  gh.lazySingleton<_i5.AppSettingsRepository>(() => appSettingsRepositoryModule
      .getAppSettingsRepository(gh<_i4.PackageInfo>()));
  gh.lazySingleton<_i5.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i7.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.LocationsOutputPort>(
      () => presentersModule.getLocationsOutputPort(
            gh<_i6.LocationsTabCubit>(),
            gh<_i6.LocationDetailsPageCubit>(),
            gh<_i6.RouteLocationsPageCubit>(),
            gh<_i6.LocationsFiltersPageCubit>(),
            gh<_i6.FavoriteLocationsPageCubit>(),
          ));
  gh.lazySingleton<_i7.TestDataSource>(
    () => dataSourceModule.getTestDataSource(gh<_i3.DeviceInfoPlugin>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.SettingsOutputPort>(
      () => presentersModule.getSettingsOutputPort(gh<_i6.ProfileTabCubit>()));
  await gh.lazySingletonAsync<_i5.CacheRepository>(
    () => cacheRepositoryModule.getCacheRepository(gh<_i7.HiveDataSource>()),
    preResolve: true,
  );
  gh.lazySingleton<_i5.UsersRepository>(
    () =>
        usersRepositoryModule.getTestUsersRepository(gh<_i7.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.LocationsRepository>(
    () => locationsRepositoryModule
        .getTestLocationsRepository(gh<_i7.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.RoutesRepository>(
    () => routesRepositoryModule
        .getTestRoutesRepository(gh<_i7.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.ReviewsRepository>(
    () => reviewsRepositoryModule
        .getTestReviewsRepository(gh<_i7.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.CacheRouteUseCase>(
      () => routeUseCasesModule.cacheRouteUseCase(
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
            gh<_i5.CacheRepository>(),
            gh<_i5.UsersRepository>(),
          ));
  gh.lazySingleton<_i5.GetUserSubscriptionStatus>(
      () => userUseCasesModule.getUserSubscriptionStatus(
            gh<_i5.UsersRepository>(),
            gh<_i5.LocationsOutputPort>(),
            gh<_i5.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetLocationReviewsUseCase>(
      () => reviewUseCasesModule.getLocationReviewsUseCase(
            gh<_i5.ReviewsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetRouteReviewsUseCase>(
      () => reviewUseCasesModule.getRouteReviewsUseCase(
            gh<_i5.ReviewsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetGeopositionUseCase>(
      () => geopositionUseCasesModule.getGeopositionUseCase(
            gh<_i5.GeopositionRepository>(),
            gh<_i5.GeopositionOutputPort>(),
            gh<_i5.ErrorHandlerOutputPort>(),
          ));
  gh.factory<_i5.GetLocationsAvailableFiltersUseCase>(
      () => locationUseCasesCasesModule.getLocationsAvailableFiltersUseCase(
            gh<_i5.LocationsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetAllLocationsUseCase>(
      () => locationUseCasesCasesModule.getAllLocationsUseCase(
            gh<_i5.LocationsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i5.UpdateLocationFavoriteStatusUseCase>(
      () => locationUseCasesCasesModule.getUpdateLocationFavoriteStatusUseCase(
            gh<_i5.LocationsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetLocationDetailsUseCase>(
      () => locationUseCasesCasesModule.getLocationDetailsUseCase(
            gh<_i5.LocationsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetRouteLocationsUseCase>(
      () => locationUseCasesCasesModule.getRouteLocationsUseCase(
            gh<_i5.LocationsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetFavoriteLocationsUseCase>(
      () => locationUseCasesCasesModule.getFavoriteLocationsUseCase(
            gh<_i5.LocationsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i5.IsAuthorizedUseCase>(
      () => userUseCasesModule.getIsAuthorizedUseCase(
            gh<_i5.PreferencesRepository>(),
            gh<_i5.AuthRepository>(),
            gh<_i5.UsersRepository>(),
            gh<_i5.CurrentUserOutputPort>(),
            gh<_i5.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i6.LocationDetailsPageController>(() => controllersModule
      .getLocationDetailsPageController(gh<_i5.GetLocationDetailsUseCase>()));
  gh.lazySingleton<_i6.LocationFavoriteButtonController>(() =>
      controllersModule.getLocationFavoriteButtonController(
          gh<_i5.UpdateLocationFavoriteStatusUseCase>()));
  gh.lazySingleton<_i6.LocationReviewsPageController>(() => controllersModule
      .getLocationReviewsPageController(gh<_i5.GetLocationReviewsUseCase>()));
  gh.lazySingleton<_i6.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i5.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i6.LocationFiltersPageController>(() => controllersModule
      .getLocationFiltersPageController(gh<_i5.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i5.TripsRepository>(
    () => tripsRepositoryModule.getTripsRepository(gh<_i7.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.DeleteCachedRouteUseCase>(
      () => routeUseCasesModule.deleteCachedRouteUseCase(
            gh<_i5.CacheRepository>(),
            gh<_i5.RoutesOutputPort>(),
            gh<_i5.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i6.RouteReviewsPageController>(() => controllersModule
      .getRouteReviewsPageController(gh<_i5.GetRouteReviewsUseCase>()));
  gh.lazySingleton<_i5.GetCachedRoutesUseCase>(
      () => routeUseCasesModule.getCachedRoutesUseCase(
            gh<_i5.CacheRepository>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i6.CachedRoutesTabController>(
      () => controllersModule.cachedRoutesTabController(
            gh<_i5.GetCachedRoutesUseCase>(),
            gh<_i5.DeleteCachedRouteUseCase>(),
          ));
  gh.lazySingleton<_i5.GetAppVersion>(
      () => settingsUseCasesModule.getAppVersion(
            gh<_i5.AppSettingsRepository>(),
            gh<_i5.SettingsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetAllRoutesUseCase>(
      () => routeUseCasesModule.getAllRoutesUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.UpdateRouteFavoriteStatusUseCase>(
      () => routeUseCasesModule.getUpdateRouteFavoriteStatusUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetRouteDetailsUseCase>(
      () => routeUseCasesModule.getRouteDetailsUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetRoutesAvailableFiltersUseCase>(
      () => routeUseCasesModule.getRoutesAvailableFiltersUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.CreateNewRouteUseCase>(
      () => routeUseCasesModule.getCreateNewRouteUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetRoutePreviewUseCase>(
      () => routeUseCasesModule.getGetRoutePreviewUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetFavoriteRoutesUseCase>(
      () => routeUseCasesModule.getFavoriteRoutesUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetMyOwnRoutesUseCase>(
      () => routeUseCasesModule.getMyOwnRoutesUseCase(
            gh<_i5.RoutesRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i6.RouteLocationsPageController>(() => controllersModule
      .getRouteLocationsController(gh<_i5.GetRouteLocationsUseCase>()));
  gh.lazySingleton<_i6.RouteDetailsPageController>(() => controllersModule
      .getRouteDetailsPageController(gh<_i5.GetRouteDetailsUseCase>()));
  gh.lazySingleton<_i6.FavoriteLocationsPageController>(() =>
      controllersModule.getFavoriteLocationsPageController(
          gh<_i5.GetFavoriteLocationsUseCase>()));
  gh.lazySingleton<_i6.RouteMapPageController>(
      () => controllersModule.getRouteMapPageController(
            gh<_i5.CacheRouteUseCase>(),
            gh<_i5.GetRouteDetailsUseCase>(),
            gh<_i5.GetGeopositionUseCase>(),
          ));
  gh.lazySingleton<_i5.GetTripsUseCase>(
      () => tripUseCasesModule.getAllTripsUseCase(
            gh<_i5.TripsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i5.GetTripDetailsUseCase>(
      () => tripUseCasesModule.getTripDetailsUseCase(
            gh<_i5.TripsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i5.CompleteTripUseCase>(
      () => tripUseCasesModule.completeTripUseCase(
            gh<_i5.TripsRepository>(),
            gh<_i5.ErrorHandlerOutputPort>(),
            gh<_i5.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i6.FavoriteRoutesTabController>(() => controllersModule
      .favoriteRoutesTabController(gh<_i5.GetFavoriteRoutesUseCase>()));
  gh.lazySingleton<_i6.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i5.IsAuthorizedUseCase>(),
            gh<_i5.GetAllLocationsUseCase>(),
            gh<_i5.GetAllRoutesUseCase>(),
            gh<_i5.GetLocationsAvailableFiltersUseCase>(),
            gh<_i5.GetRoutesAvailableFiltersUseCase>(),
            gh<_i5.GetAppVersion>(),
            gh<_i5.GetTripsUseCase>(),
            gh<_i5.GetFavoriteLocationsUseCase>(),
            gh<_i5.GetFavoriteRoutesUseCase>(),
            gh<_i5.GetMyOwnRoutesUseCase>(),
            gh<_i5.GetCachedRoutesUseCase>(),
          ));
  gh.lazySingleton<_i6.MyOwnRoutesTabController>(() => controllersModule
      .myOwnRoutesTabController(gh<_i5.GetMyOwnRoutesUseCase>()));
  gh.lazySingleton<_i6.RoutesTabController>(() =>
      controllersModule.getRoutesTabController(gh<_i5.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i6.RouteFiltersPageController>(() => controllersModule
      .getRouteFiltersPageController(gh<_i5.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i6.RouteFavoriteButtonController>(() =>
      controllersModule.getRouteFavoriteButtonController(
          gh<_i5.UpdateRouteFavoriteStatusUseCase>()));
  gh.lazySingleton<_i6.CreateRoutePageController>(
      () => controllersModule.createRoutePageController(
            gh<_i5.GetRoutePreviewUseCase>(),
            gh<_i5.CreateNewRouteUseCase>(),
          ));
  gh.lazySingleton<_i6.TripDetailsPageController>(
      () => controllersModule.getTripDetailsPageController(
            gh<_i5.GetTripDetailsUseCase>(),
            gh<_i5.CompleteTripUseCase>(),
          ));
  gh.lazySingleton<_i6.TripsTabController>(
      () => controllersModule.getTripsTabController(gh<_i5.GetTripsUseCase>()));
  gh.lazySingleton<_i6.TripFiltersPageController>(() => controllersModule
      .getTripFiltersPageController(gh<_i5.GetTripsUseCase>()));
  return getIt;
}

class _$DataPackagesModule extends _i8.DataPackagesModule {}

class _$PresentersModule extends _i9.PresentersModule {}

class _$AutoRouterModule extends _i10.AutoRouterModule {}

class _$BlocModule extends _i11.BlocModule {}

class _$DataSourceModule extends _i12.DataSourceModule {}

class _$GeopositionRepositoryModule extends _i13.GeopositionRepositoryModule {}

class _$AuthRepositoryModule extends _i14.AuthRepositoryModule {}

class _$AppSettingsRepositoryModule extends _i15.AppSettingsRepositoryModule {}

class _$PreferencesRepositoryModule extends _i16.PreferencesRepositoryModule {}

class _$CacheRepositoryModule extends _i17.CacheRepositoryModule {}

class _$UsersRepositoryModule extends _i18.UsersRepositoryModule {}

class _$LocationsRepositoryModule extends _i19.LocationsRepositoryModule {}

class _$RoutesRepositoryModule extends _i20.RoutesRepositoryModule {}

class _$ReviewsRepositoryModule extends _i21.ReviewsRepositoryModule {}

class _$RouteUseCasesModule extends _i22.RouteUseCasesModule {}

class _$UserUseCasesModule extends _i23.UserUseCasesModule {}

class _$ReviewUseCasesModule extends _i24.ReviewUseCasesModule {}

class _$GeopositionUseCasesModule extends _i25.GeopositionUseCasesModule {}

class _$LocationUseCasesCasesModule extends _i26.LocationUseCasesCasesModule {}

class _$ControllersModule extends _i27.ControllersModule {}

class _$TripsRepositoryModule extends _i28.TripsRepositoryModule {}

class _$SettingsUseCasesModule extends _i29.SettingsUseCasesModule {}

class _$TripUseCasesModule extends _i30.TripUseCasesModule {}
