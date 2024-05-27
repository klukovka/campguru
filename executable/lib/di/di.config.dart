// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i6;
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i8;
import 'package:domain/domain.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:presentation/presentation.dart' as _i5;

import 'data_modules/app_settings_repository_module.dart' as _i16;
import 'data_modules/auth_repository_module.dart' as _i30;
import 'data_modules/cache_repository_module.dart' as _i17;
import 'data_modules/data_packages_module.dart' as _i9;
import 'data_modules/data_source_module.dart' as _i12;
import 'data_modules/dio_module.dart' as _i24;
import 'data_modules/geoposition_repository_module.dart' as _i13;
import 'data_modules/locations_repository_module.dart' as _i18;
import 'data_modules/preferences_repository_module.dart' as _i15;
import 'data_modules/reviews_repository_module.dart' as _i20;
import 'data_modules/routes_repository_module.dart' as _i19;
import 'data_modules/trips_repository_module.dart' as _i27;
import 'data_modules/users_repository_module.dart' as _i31;
import 'domain_modules/geoposition_use_cases_module.dart' as _i22;
import 'domain_modules/location_use_cases_module.dart' as _i23;
import 'domain_modules/review_use_cases_module.dart' as _i21;
import 'domain_modules/route_use_cases_module.dart' as _i28;
import 'domain_modules/settings_use_cases_module.dart' as _i29;
import 'domain_modules/trip_use_cases_module.dart' as _i32;
import 'domain_modules/user_use_cases_module.dart' as _i26;
import 'presentation_modules/auto_router_module.dart' as _i10;
import 'presentation_modules/bloc_module.dart' as _i11;
import 'presentation_modules/controllers_module.dart' as _i25;
import 'presentation_modules/presenters_module.dart' as _i14;

const String _dev = 'dev';
const String _prod = 'prod';
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
  final autoRouterModule = _$AutoRouterModule();
  final blocModule = _$BlocModule();
  final dataSourceModule = _$DataSourceModule();
  final geopositionRepositoryModule = _$GeopositionRepositoryModule();
  final presentersModule = _$PresentersModule();
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final appSettingsRepositoryModule = _$AppSettingsRepositoryModule();
  final cacheRepositoryModule = _$CacheRepositoryModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final routesRepositoryModule = _$RoutesRepositoryModule();
  final reviewsRepositoryModule = _$ReviewsRepositoryModule();
  final reviewUseCasesModule = _$ReviewUseCasesModule();
  final geopositionUseCasesModule = _$GeopositionUseCasesModule();
  final locationUseCasesCasesModule = _$LocationUseCasesCasesModule();
  final dioModule = _$DioModule();
  final controllersModule = _$ControllersModule();
  final userUseCasesModule = _$UserUseCasesModule();
  final tripsRepositoryModule = _$TripsRepositoryModule();
  final routeUseCasesModule = _$RouteUseCasesModule();
  final settingsUseCasesModule = _$SettingsUseCasesModule();
  final authRepositoryModule = _$AuthRepositoryModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
  final tripUseCasesModule = _$TripUseCasesModule();
  gh.singleton<_i3.DeviceInfoPlugin>(() => dataPackagesModule.deviceInfoPlugin);
  await gh.singletonAsync<_i4.PackageInfo>(
    () => dataPackagesModule.packageInfo(),
    preResolve: true,
  );
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
  gh.lazySingleton<_i5.TripsTabCubit>(() => blocModule.tripsTabCubit);
  gh.lazySingleton<_i5.TripsFiltersPageCubit>(
      () => blocModule.tripsFiltersPageCubit);
  gh.lazySingleton<_i5.TripDetailsPageCubit>(
      () => blocModule.tripDetailsPageCubit);
  gh.lazySingleton<_i5.RouteCacheProgressViewCubit>(
      () => blocModule.routeCacheProgressViewCubit);
  gh.lazySingleton<_i5.RouteMapPageCubit>(() => blocModule.routeMapPageCubit);
  gh.lazySingleton<_i5.FavoriteLocationsPageCubit>(
      () => blocModule.favoriteLocationsPageCubit);
  gh.lazySingleton<_i5.CreateRoutePageCubit>(
      () => blocModule.createRoutePageCubit);
  gh.lazySingleton<_i5.FavoriteRoutesTabCubit>(
      () => blocModule.favoriteRoutesTabCubit);
  gh.lazySingleton<_i5.MyOwnRoutesTabCubit>(
      () => blocModule.myOwnRoutesTabCubit);
  gh.lazySingleton<_i5.CachedRoutesTabCubit>(
      () => blocModule.cachedRoutesTabCubit);
  gh.lazySingleton<_i5.SignUpPageCubit>(() => blocModule.signUpPageCubit);
  gh.lazySingleton<_i5.StartPageCubit>(() => blocModule.startPageCubit);
  gh.lazySingleton<_i5.AppControlCubit>(() => blocModule.appControlCubit);
  await gh.lazySingletonAsync<_i6.HiveDataSource>(
    () => dataSourceModule.getHiveDataSource(),
    preResolve: true,
  );
  gh.lazySingleton<_i7.GeopositionRepository>(
      () => geopositionRepositoryModule.geopositionRepository);
  gh.lazySingleton<_i7.CurrentUserOutputPort>(
      () => presentersModule.getCurrentUserOutputPort(
            gh<_i5.SplashPageCubit>(),
            gh<_i5.HomePageCubit>(),
            gh<_i5.ProfileTabCubit>(),
            gh<_i5.SignUpPageCubit>(),
            gh<_i5.StartPageCubit>(),
          ));
  gh.lazySingleton<_i5.CampguruRouter>(
      () => autoRouterModule.router(gh<_i5.AppAutoRouter>()));
  gh.lazySingleton<_i7.RoutesOutputPort>(
      () => presentersModule.getRoutesOutputPort(
            gh<_i5.RoutesTabCubit>(),
            gh<_i5.RouteDetailsPageCubit>(),
            gh<_i5.RoutesFiltersPageCubit>(),
            gh<_i5.HomePageCubit>(),
            gh<_i5.RouteCacheProgressViewCubit>(),
            gh<_i5.RouteMapPageCubit>(),
            gh<_i5.CreateRoutePageCubit>(),
            gh<_i5.FavoriteRoutesTabCubit>(),
            gh<_i5.MyOwnRoutesTabCubit>(),
            gh<_i5.CachedRoutesTabCubit>(),
          ));
  gh.lazySingleton<_i7.ErrorHandlerOutputPort>(() =>
      presentersModule.getErrorHandlerOutputPort(gh<_i5.AppControlCubit>()));
  gh.lazySingleton<_i7.TripsOutputPort>(
      () => presentersModule.getTripsOutputPort(
            gh<_i5.TripsTabCubit>(),
            gh<_i5.TripsFiltersPageCubit>(),
            gh<_i5.TripDetailsPageCubit>(),
          ));
  gh.lazySingleton<_i7.PreferencesRepository>(
    () => preferencesRepositoryModule
        .stablePreferencesRepository(gh<_i6.HiveDataSource>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i7.GeopositionOutputPort>(
      () => presentersModule.geopositionPresenter(gh<_i5.RouteMapPageCubit>()));
  gh.lazySingleton<_i7.ReviewsOutputPort>(
      () => presentersModule.getReviewsOutputPort(
            gh<_i5.LocationReviewsPageCubit>(),
            gh<_i5.RouteReviewsPageCubit>(),
          ));
  gh.lazySingleton<_i7.AppSettingsRepository>(() => appSettingsRepositoryModule
      .getAppSettingsRepository(gh<_i4.PackageInfo>()));
  gh.lazySingleton<_i7.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i6.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.LocationsOutputPort>(
      () => presentersModule.getLocationsOutputPort(
            gh<_i5.LocationsTabCubit>(),
            gh<_i5.LocationDetailsPageCubit>(),
            gh<_i5.RouteLocationsPageCubit>(),
            gh<_i5.LocationsFiltersPageCubit>(),
            gh<_i5.FavoriteLocationsPageCubit>(),
          ));
  gh.lazySingleton<_i6.TestDataSource>(
    () => dataSourceModule.getTestDataSource(gh<_i3.DeviceInfoPlugin>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.SettingsOutputPort>(
      () => presentersModule.getSettingsOutputPort(gh<_i5.ProfileTabCubit>()));
  await gh.lazySingletonAsync<_i7.CacheRepository>(
    () => cacheRepositoryModule.getCacheRepository(gh<_i6.HiveDataSource>()),
    preResolve: true,
  );
  gh.lazySingleton<_i7.LocationsRepository>(
    () => locationsRepositoryModule
        .getTestLocationsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.RoutesRepository>(
    () => routesRepositoryModule
        .getTestRoutesRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.ReviewsRepository>(
    () => reviewsRepositoryModule
        .getTestReviewsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.GetLocationReviewsUseCase>(
      () => reviewUseCasesModule.getLocationReviewsUseCase(
            gh<_i7.ReviewsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetRouteReviewsUseCase>(
      () => reviewUseCasesModule.getRouteReviewsUseCase(
            gh<_i7.ReviewsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetGeopositionUseCase>(
      () => geopositionUseCasesModule.getGeopositionUseCase(
            gh<_i7.GeopositionRepository>(),
            gh<_i7.GeopositionOutputPort>(),
            gh<_i7.ErrorHandlerOutputPort>(),
          ));
  gh.factory<_i7.GetLocationsAvailableFiltersUseCase>(
      () => locationUseCasesCasesModule.getLocationsAvailableFiltersUseCase(
            gh<_i7.LocationsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetAllLocationsUseCase>(
      () => locationUseCasesCasesModule.getAllLocationsUseCase(
            gh<_i7.LocationsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i7.UpdateLocationFavoriteStatusUseCase>(
      () => locationUseCasesCasesModule.getUpdateLocationFavoriteStatusUseCase(
            gh<_i7.LocationsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetLocationDetailsUseCase>(
      () => locationUseCasesCasesModule.getLocationDetailsUseCase(
            gh<_i7.LocationsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetRouteLocationsUseCase>(
      () => locationUseCasesCasesModule.getRouteLocationsUseCase(
            gh<_i7.LocationsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetFavoriteLocationsUseCase>(
      () => locationUseCasesCasesModule.getFavoriteLocationsUseCase(
            gh<_i7.LocationsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i6.AuthInterceptor>(
      () => dioModule.authInterceptor(gh<_i7.PreferencesRepository>()));
  gh.lazySingleton<_i5.LocationDetailsPageController>(() => controllersModule
      .getLocationDetailsPageController(gh<_i7.GetLocationDetailsUseCase>()));
  gh.lazySingleton<_i5.LocationFavoriteButtonController>(() =>
      controllersModule.getLocationFavoriteButtonController(
          gh<_i7.UpdateLocationFavoriteStatusUseCase>()));
  gh.lazySingleton<_i8.Dio>(
    () => dioModule.prodDio(gh<_i6.AuthInterceptor>()),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i8.Dio>(
    () => dioModule.dio(gh<_i6.AuthInterceptor>()),
    registerFor: {
      _test,
      _dev,
    },
  );
  gh.lazySingleton<_i5.LocationReviewsPageController>(() => controllersModule
      .getLocationReviewsPageController(gh<_i7.GetLocationReviewsUseCase>()));
  gh.lazySingleton<_i5.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i7.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i5.LocationFiltersPageController>(() => controllersModule
      .getLocationFiltersPageController(gh<_i7.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i7.LogoutUseCase>(() => userUseCasesModule.logoutUseCase(
        gh<_i7.PreferencesRepository>(),
        gh<_i7.CacheRepository>(),
      ));
  gh.lazySingleton<_i7.TripsRepository>(
    () => tripsRepositoryModule.getTripsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.DeleteCachedRouteUseCase>(
      () => routeUseCasesModule.deleteCachedRouteUseCase(
            gh<_i7.CacheRepository>(),
            gh<_i7.RoutesOutputPort>(),
            gh<_i7.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteReviewsPageController>(() => controllersModule
      .getRouteReviewsPageController(gh<_i7.GetRouteReviewsUseCase>()));
  gh.lazySingleton<_i7.GetCachedRoutesUseCase>(
      () => routeUseCasesModule.getCachedRoutesUseCase(
            gh<_i7.CacheRepository>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.CachedRoutesTabController>(
      () => controllersModule.cachedRoutesTabController(
            gh<_i7.GetCachedRoutesUseCase>(),
            gh<_i7.DeleteCachedRouteUseCase>(),
          ));
  gh.lazySingleton<_i5.ProfileTabController>(
      () => controllersModule.profileTabController(gh<_i7.LogoutUseCase>()));
  gh.lazySingleton<_i7.GetAppVersion>(
      () => settingsUseCasesModule.getAppVersion(
            gh<_i7.AppSettingsRepository>(),
            gh<_i7.SettingsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetAllRoutesUseCase>(
      () => routeUseCasesModule.getAllRoutesUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i7.UpdateRouteFavoriteStatusUseCase>(
      () => routeUseCasesModule.getUpdateRouteFavoriteStatusUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetRouteDetailsUseCase>(
      () => routeUseCasesModule.getRouteDetailsUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetRoutesAvailableFiltersUseCase>(
      () => routeUseCasesModule.getRoutesAvailableFiltersUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i7.CreateNewRouteUseCase>(
      () => routeUseCasesModule.getCreateNewRouteUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetRoutePreviewUseCase>(
      () => routeUseCasesModule.getGetRoutePreviewUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetFavoriteRoutesUseCase>(
      () => routeUseCasesModule.getFavoriteRoutesUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetMyOwnRoutesUseCase>(
      () => routeUseCasesModule.getMyOwnRoutesUseCase(
            gh<_i7.RoutesRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteLocationsPageController>(() => controllersModule
      .getRouteLocationsController(gh<_i7.GetRouteLocationsUseCase>()));
  gh.lazySingleton<_i5.RouteDetailsPageController>(() => controllersModule
      .getRouteDetailsPageController(gh<_i7.GetRouteDetailsUseCase>()));
  gh.lazySingleton<_i5.FavoriteLocationsPageController>(() =>
      controllersModule.getFavoriteLocationsPageController(
          gh<_i7.GetFavoriteLocationsUseCase>()));
  gh.lazySingleton<_i7.AuthRepository>(
    () => authRepositoryModule.testAuthRepository(gh<_i8.Dio>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.UsersRepository>(
    () => usersRepositoryModule.apiUsersRepository(gh<_i8.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i7.AuthRepository>(
    () => authRepositoryModule.apiAuthRepository(gh<_i8.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i7.UsersRepository>(
    () => usersRepositoryModule.getTestUsersRepository(
      gh<_i6.TestDataSource>(),
      gh<_i8.Dio>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i7.GetTripsUseCase>(
      () => tripUseCasesModule.getAllTripsUseCase(
            gh<_i7.TripsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i7.GetTripDetailsUseCase>(
      () => tripUseCasesModule.getTripDetailsUseCase(
            gh<_i7.TripsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i7.CompleteTripUseCase>(
      () => tripUseCasesModule.completeTripUseCase(
            gh<_i7.TripsRepository>(),
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i5.FavoriteRoutesTabController>(() => controllersModule
      .favoriteRoutesTabController(gh<_i7.GetFavoriteRoutesUseCase>()));
  gh.lazySingleton<_i7.SignUpUseCase>(() => userUseCasesModule.signUpUseCase(
        gh<_i7.PreferencesRepository>(),
        gh<_i7.AuthRepository>(),
        gh<_i7.CurrentUserOutputPort>(),
        gh<_i7.ErrorHandlerOutputPort>(),
      ));
  gh.lazySingleton<_i7.LoginUseCase>(() => userUseCasesModule.loginUseCase(
        gh<_i7.PreferencesRepository>(),
        gh<_i7.AuthRepository>(),
        gh<_i7.CurrentUserOutputPort>(),
        gh<_i7.ErrorHandlerOutputPort>(),
      ));
  gh.lazySingleton<_i5.MyOwnRoutesTabController>(() => controllersModule
      .myOwnRoutesTabController(gh<_i7.GetMyOwnRoutesUseCase>()));
  gh.lazySingleton<_i5.SignUpPageController>(
      () => controllersModule.signUpPageController(gh<_i7.SignUpUseCase>()));
  gh.lazySingleton<_i5.RoutesTabController>(() =>
      controllersModule.getRoutesTabController(gh<_i7.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFiltersPageController>(() => controllersModule
      .getRouteFiltersPageController(gh<_i7.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFavoriteButtonController>(() =>
      controllersModule.getRouteFavoriteButtonController(
          gh<_i7.UpdateRouteFavoriteStatusUseCase>()));
  gh.lazySingleton<_i5.CreateRoutePageController>(
      () => controllersModule.createRoutePageController(
            gh<_i7.GetRoutePreviewUseCase>(),
            gh<_i7.CreateNewRouteUseCase>(),
          ));
  gh.lazySingleton<_i7.IsAuthorizedUseCase>(
      () => userUseCasesModule.getIsAuthorizedUseCase(
            gh<_i7.PreferencesRepository>(),
            gh<_i7.AuthRepository>(),
            gh<_i7.UsersRepository>(),
            gh<_i7.CurrentUserOutputPort>(),
          ));
  gh.lazySingleton<_i5.TripDetailsPageController>(
      () => controllersModule.getTripDetailsPageController(
            gh<_i7.GetTripDetailsUseCase>(),
            gh<_i7.CompleteTripUseCase>(),
          ));
  gh.lazySingleton<_i5.StartPageController>(
      () => controllersModule.startPageController(gh<_i7.LoginUseCase>()));
  gh.lazySingleton<_i7.CacheRouteUseCase>(
      () => routeUseCasesModule.cacheRouteUseCase(
            gh<_i7.ErrorHandlerOutputPort>(),
            gh<_i7.RoutesOutputPort>(),
            gh<_i7.CacheRepository>(),
            gh<_i7.UsersRepository>(),
          ));
  gh.lazySingleton<_i7.GetUserSubscriptionStatus>(
      () => userUseCasesModule.getUserSubscriptionStatus(
            gh<_i7.UsersRepository>(),
            gh<_i7.LocationsOutputPort>(),
            gh<_i7.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.TripsTabController>(
      () => controllersModule.getTripsTabController(gh<_i7.GetTripsUseCase>()));
  gh.lazySingleton<_i5.TripFiltersPageController>(() => controllersModule
      .getTripFiltersPageController(gh<_i7.GetTripsUseCase>()));
  gh.lazySingleton<_i5.RouteMapPageController>(
      () => controllersModule.getRouteMapPageController(
            gh<_i7.CacheRouteUseCase>(),
            gh<_i7.GetRouteDetailsUseCase>(),
            gh<_i7.GetGeopositionUseCase>(),
          ));
  gh.lazySingleton<_i5.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i7.IsAuthorizedUseCase>(),
            gh<_i7.GetAllLocationsUseCase>(),
            gh<_i7.GetAllRoutesUseCase>(),
            gh<_i7.GetLocationsAvailableFiltersUseCase>(),
            gh<_i7.GetRoutesAvailableFiltersUseCase>(),
            gh<_i7.GetAppVersion>(),
            gh<_i7.GetTripsUseCase>(),
            gh<_i7.GetFavoriteLocationsUseCase>(),
            gh<_i7.GetFavoriteRoutesUseCase>(),
            gh<_i7.GetMyOwnRoutesUseCase>(),
            gh<_i7.GetCachedRoutesUseCase>(),
          ));
  return getIt;
}

class _$DataPackagesModule extends _i9.DataPackagesModule {}

class _$AutoRouterModule extends _i10.AutoRouterModule {}

class _$BlocModule extends _i11.BlocModule {}

class _$DataSourceModule extends _i12.DataSourceModule {}

class _$GeopositionRepositoryModule extends _i13.GeopositionRepositoryModule {}

class _$PresentersModule extends _i14.PresentersModule {}

class _$PreferencesRepositoryModule extends _i15.PreferencesRepositoryModule {}

class _$AppSettingsRepositoryModule extends _i16.AppSettingsRepositoryModule {}

class _$CacheRepositoryModule extends _i17.CacheRepositoryModule {}

class _$LocationsRepositoryModule extends _i18.LocationsRepositoryModule {}

class _$RoutesRepositoryModule extends _i19.RoutesRepositoryModule {}

class _$ReviewsRepositoryModule extends _i20.ReviewsRepositoryModule {}

class _$ReviewUseCasesModule extends _i21.ReviewUseCasesModule {}

class _$GeopositionUseCasesModule extends _i22.GeopositionUseCasesModule {}

class _$LocationUseCasesCasesModule extends _i23.LocationUseCasesCasesModule {}

class _$DioModule extends _i24.DioModule {}

class _$ControllersModule extends _i25.ControllersModule {}

class _$UserUseCasesModule extends _i26.UserUseCasesModule {}

class _$TripsRepositoryModule extends _i27.TripsRepositoryModule {}

class _$RouteUseCasesModule extends _i28.RouteUseCasesModule {}

class _$SettingsUseCasesModule extends _i29.SettingsUseCasesModule {}

class _$AuthRepositoryModule extends _i30.AuthRepositoryModule {}

class _$UsersRepositoryModule extends _i31.UsersRepositoryModule {}

class _$TripUseCasesModule extends _i32.TripUseCasesModule {}
