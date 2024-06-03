// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:data/data.dart' as _i6;
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i10;
import 'package:domain/domain.dart' as _i9;
import 'package:firebase_core/firebase_core.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:presentation/presentation.dart' as _i5;

import 'data_modules/app_settings_repository_module.dart' as _i20;
import 'data_modules/auth_repository_module.dart' as _i35;
import 'data_modules/cache_repository_module.dart' as _i22;
import 'data_modules/chats_repository_module.dart' as _i17;
import 'data_modules/data_packages_module.dart' as _i11;
import 'data_modules/data_source_module.dart' as _i14;
import 'data_modules/dio_module.dart' as _i30;
import 'data_modules/firebase_module.dart' as _i15;
import 'data_modules/geoposition_repository_module.dart' as _i16;
import 'data_modules/locations_repository_module.dart' as _i23;
import 'data_modules/preferences_repository_module.dart' as _i19;
import 'data_modules/reviews_repository_module.dart' as _i25;
import 'data_modules/routes_repository_module.dart' as _i24;
import 'data_modules/trips_repository_module.dart' as _i32;
import 'data_modules/users_repository_module.dart' as _i36;
import 'domain_modules/geoposition_use_cases_module.dart' as _i28;
import 'domain_modules/location_use_cases_module.dart' as _i29;
import 'domain_modules/review_use_cases_module.dart' as _i26;
import 'domain_modules/route_use_cases_module.dart' as _i33;
import 'domain_modules/settings_use_cases_module.dart' as _i34;
import 'domain_modules/trip_use_cases_module.dart' as _i27;
import 'domain_modules/user_use_cases_module.dart' as _i21;
import 'presentation_modules/auto_router_module.dart' as _i12;
import 'presentation_modules/bloc_module.dart' as _i13;
import 'presentation_modules/controllers_module.dart' as _i31;
import 'presentation_modules/presenters_module.dart' as _i18;

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
  final firebaseModule = _$FirebaseModule();
  final geopositionRepositoryModule = _$GeopositionRepositoryModule();
  final chatsRepositoryModule = _$ChatsRepositoryModule();
  final presentersModule = _$PresentersModule();
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final appSettingsRepositoryModule = _$AppSettingsRepositoryModule();
  final userUseCasesModule = _$UserUseCasesModule();
  final cacheRepositoryModule = _$CacheRepositoryModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final routesRepositoryModule = _$RoutesRepositoryModule();
  final reviewsRepositoryModule = _$ReviewsRepositoryModule();
  final reviewUseCasesModule = _$ReviewUseCasesModule();
  final tripUseCasesModule = _$TripUseCasesModule();
  final geopositionUseCasesModule = _$GeopositionUseCasesModule();
  final locationUseCasesCasesModule = _$LocationUseCasesCasesModule();
  final dioModule = _$DioModule();
  final controllersModule = _$ControllersModule();
  final tripsRepositoryModule = _$TripsRepositoryModule();
  final routeUseCasesModule = _$RouteUseCasesModule();
  final settingsUseCasesModule = _$SettingsUseCasesModule();
  final authRepositoryModule = _$AuthRepositoryModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
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
  gh.lazySingleton<_i5.CachedRouteDetailsPageCubit>(
      () => blocModule.cachedRouteDetailsPageCubit);
  gh.lazySingleton<_i5.CachedRouteMapPageCubit>(
      () => blocModule.cachedRouteMapPageCubit);
  gh.lazySingleton<_i5.CreateTripPageCubit>(
      () => blocModule.createTripPageCubit);
  await gh.lazySingletonAsync<_i6.HiveDataSource>(
    () => dataSourceModule.getHiveDataSource(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i7.FirebaseApp>(
    () => firebaseModule.app(),
    preResolve: true,
  );
  gh.lazySingleton<_i8.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore());
  gh.lazySingleton<_i9.GeopositionRepository>(
      () => geopositionRepositoryModule.geopositionRepository);
  gh.lazySingleton<_i9.ChatsRepository>(
      () => chatsRepositoryModule.chatsRepository(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i9.UsersOutputPort>(
      () => presentersModule.usersOutputPort(gh<_i5.CreateTripPageCubit>()));
  gh.lazySingleton<_i9.CurrentUserOutputPort>(
      () => presentersModule.getCurrentUserOutputPort(
            gh<_i5.SplashPageCubit>(),
            gh<_i5.HomePageCubit>(),
            gh<_i5.ProfileTabCubit>(),
            gh<_i5.SignUpPageCubit>(),
            gh<_i5.StartPageCubit>(),
          ));
  gh.lazySingleton<_i5.CampguruRouter>(
      () => autoRouterModule.router(gh<_i5.AppAutoRouter>()));
  gh.lazySingleton<_i9.ErrorHandlerOutputPort>(() =>
      presentersModule.getErrorHandlerOutputPort(gh<_i5.AppControlCubit>()));
  gh.lazySingleton<_i9.GeopositionOutputPort>(
      () => presentersModule.geopositionPresenter(
            gh<_i5.RouteMapPageCubit>(),
            gh<_i5.CachedRouteMapPageCubit>(),
          ));
  gh.lazySingleton<_i9.PreferencesRepository>(
    () => preferencesRepositoryModule
        .stablePreferencesRepository(gh<_i6.HiveDataSource>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i9.ReviewsOutputPort>(
      () => presentersModule.getReviewsOutputPort(
            gh<_i5.LocationReviewsPageCubit>(),
            gh<_i5.RouteReviewsPageCubit>(),
          ));
  gh.lazySingleton<_i9.AppSettingsRepository>(() => appSettingsRepositoryModule
      .getAppSettingsRepository(gh<_i4.PackageInfo>()));
  gh.lazySingleton<_i9.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i6.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i9.TripsOutputPort>(
      () => presentersModule.getTripsOutputPort(
            gh<_i5.TripsTabCubit>(),
            gh<_i5.TripsFiltersPageCubit>(),
            gh<_i5.TripDetailsPageCubit>(),
            gh<_i5.CreateTripPageCubit>(),
          ));
  gh.lazySingleton<_i9.RemoveUserFromCreatingTripUseCase>(() =>
      userUseCasesModule
          .removeUserFromCreatingTripUseCase(gh<_i9.UsersOutputPort>()));
  gh.lazySingleton<_i9.LocationsOutputPort>(
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
  gh.lazySingleton<_i9.RoutesOutputPort>(
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
            gh<_i5.CachedRouteDetailsPageCubit>(),
            gh<_i5.CachedRouteMapPageCubit>(),
          ));
  gh.lazySingleton<_i9.SettingsOutputPort>(
      () => presentersModule.getSettingsOutputPort(gh<_i5.ProfileTabCubit>()));
  await gh.lazySingletonAsync<_i9.CacheRepository>(
    () => cacheRepositoryModule.getCacheRepository(gh<_i6.HiveDataSource>()),
    preResolve: true,
  );
  gh.lazySingleton<_i9.LocationsRepository>(
    () => locationsRepositoryModule
        .getTestLocationsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i9.RoutesRepository>(
    () => routesRepositoryModule
        .getTestRoutesRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i9.ReviewsRepository>(
    () => reviewsRepositoryModule
        .getTestReviewsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i9.GetLocationReviewsUseCase>(
      () => reviewUseCasesModule.getLocationReviewsUseCase(
            gh<_i9.ReviewsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetRouteReviewsUseCase>(
      () => reviewUseCasesModule.getRouteReviewsUseCase(
            gh<_i9.ReviewsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i9.SetTripRouteUseCase>(
      () => tripUseCasesModule.setTripRouteUseCase(gh<_i9.TripsOutputPort>()));
  gh.lazySingleton<_i9.GetGeopositionUseCase>(
      () => geopositionUseCasesModule.getGeopositionUseCase(
            gh<_i9.GeopositionRepository>(),
            gh<_i9.GeopositionOutputPort>(),
            gh<_i9.ErrorHandlerOutputPort>(),
          ));
  gh.factory<_i9.GetLocationsAvailableFiltersUseCase>(
      () => locationUseCasesCasesModule.getLocationsAvailableFiltersUseCase(
            gh<_i9.LocationsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetAllLocationsUseCase>(
      () => locationUseCasesCasesModule.getAllLocationsUseCase(
            gh<_i9.LocationsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i9.UpdateLocationFavoriteStatusUseCase>(
      () => locationUseCasesCasesModule.getUpdateLocationFavoriteStatusUseCase(
            gh<_i9.LocationsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetLocationDetailsUseCase>(
      () => locationUseCasesCasesModule.getLocationDetailsUseCase(
            gh<_i9.LocationsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetRouteLocationsUseCase>(
      () => locationUseCasesCasesModule.getRouteLocationsUseCase(
            gh<_i9.LocationsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetFavoriteLocationsUseCase>(
      () => locationUseCasesCasesModule.getFavoriteLocationsUseCase(
            gh<_i9.LocationsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i6.AuthInterceptor>(
      () => dioModule.authInterceptor(gh<_i9.PreferencesRepository>()));
  gh.lazySingleton<_i5.LocationDetailsPageController>(() => controllersModule
      .getLocationDetailsPageController(gh<_i9.GetLocationDetailsUseCase>()));
  gh.lazySingleton<_i5.LocationFavoriteButtonController>(() =>
      controllersModule.getLocationFavoriteButtonController(
          gh<_i9.UpdateLocationFavoriteStatusUseCase>()));
  gh.lazySingleton<_i10.Dio>(
    () => dioModule.prodDio(gh<_i6.AuthInterceptor>()),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i10.Dio>(
    () => dioModule.dio(gh<_i6.AuthInterceptor>()),
    registerFor: {
      _test,
      _dev,
    },
  );
  gh.lazySingleton<_i5.LocationReviewsPageController>(() => controllersModule
      .getLocationReviewsPageController(gh<_i9.GetLocationReviewsUseCase>()));
  gh.lazySingleton<_i5.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i9.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i5.LocationFiltersPageController>(() => controllersModule
      .getLocationFiltersPageController(gh<_i9.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i9.LogoutUseCase>(() => userUseCasesModule.logoutUseCase(
        gh<_i9.PreferencesRepository>(),
        gh<_i9.CacheRepository>(),
      ));
  gh.lazySingleton<_i9.TripsRepository>(
    () => tripsRepositoryModule.getTripsRepository(gh<_i6.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i9.CreateTripUseCase>(
      () => tripUseCasesModule.createTripUseCase(
            gh<_i9.TripsRepository>(),
            gh<_i9.TripsOutputPort>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.ChatsRepository>(),
            gh<_i9.PreferencesRepository>(),
          ));
  gh.lazySingleton<_i9.DeleteCachedRouteUseCase>(
      () => routeUseCasesModule.deleteCachedRouteUseCase(
            gh<_i9.CacheRepository>(),
            gh<_i9.RoutesOutputPort>(),
            gh<_i9.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteReviewsPageController>(() => controllersModule
      .getRouteReviewsPageController(gh<_i9.GetRouteReviewsUseCase>()));
  gh.lazySingleton<_i9.GetCachedRoutesUseCase>(
      () => routeUseCasesModule.getCachedRoutesUseCase(
            gh<_i9.CacheRepository>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetCachedRouteDetailsUseCase>(
      () => routeUseCasesModule.getCachedRouteDetailsUseCase(
            gh<_i9.CacheRepository>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.CachedRoutesTabController>(
      () => controllersModule.cachedRoutesTabController(
            gh<_i9.GetCachedRoutesUseCase>(),
            gh<_i9.DeleteCachedRouteUseCase>(),
          ));
  gh.lazySingleton<_i5.CachedRouteDetailsPageController>(() =>
      controllersModule.cachedRouteDetailsPageController(
          gh<_i9.GetCachedRouteDetailsUseCase>()));
  gh.lazySingleton<_i5.ProfileTabController>(
      () => controllersModule.profileTabController(gh<_i9.LogoutUseCase>()));
  gh.lazySingleton<_i5.CachedRouteMapPageController>(
      () => controllersModule.cachedRouteMapPageController(
            gh<_i9.GetCachedRouteDetailsUseCase>(),
            gh<_i9.GetGeopositionUseCase>(),
          ));
  gh.lazySingleton<_i9.GetAppVersion>(
      () => settingsUseCasesModule.getAppVersion(
            gh<_i9.AppSettingsRepository>(),
            gh<_i9.SettingsOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetAllRoutesUseCase>(
      () => routeUseCasesModule.getAllRoutesUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.UpdateRouteFavoriteStatusUseCase>(
      () => routeUseCasesModule.getUpdateRouteFavoriteStatusUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetRouteDetailsUseCase>(
      () => routeUseCasesModule.getRouteDetailsUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetRoutesAvailableFiltersUseCase>(
      () => routeUseCasesModule.getRoutesAvailableFiltersUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.CreateNewRouteUseCase>(
      () => routeUseCasesModule.getCreateNewRouteUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetRoutePreviewUseCase>(
      () => routeUseCasesModule.getGetRoutePreviewUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetFavoriteRoutesUseCase>(
      () => routeUseCasesModule.getFavoriteRoutesUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetMyOwnRoutesUseCase>(
      () => routeUseCasesModule.getMyOwnRoutesUseCase(
            gh<_i9.RoutesRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteLocationsPageController>(() => controllersModule
      .getRouteLocationsController(gh<_i9.GetRouteLocationsUseCase>()));
  gh.lazySingleton<_i5.RouteDetailsPageController>(() => controllersModule
      .getRouteDetailsPageController(gh<_i9.GetRouteDetailsUseCase>()));
  gh.lazySingleton<_i5.FavoriteLocationsPageController>(() =>
      controllersModule.getFavoriteLocationsPageController(
          gh<_i9.GetFavoriteLocationsUseCase>()));
  gh.lazySingleton<_i9.AuthRepository>(
    () => authRepositoryModule.testAuthRepository(gh<_i10.Dio>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.FavoriteRoutesTabController>(
      () => controllersModule.favoriteRoutesTabController(
            gh<_i9.GetFavoriteRoutesUseCase>(),
            gh<_i9.SetTripRouteUseCase>(),
          ));
  gh.lazySingleton<_i9.UsersRepository>(
    () => usersRepositoryModule.apiUsersRepository(gh<_i10.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i9.AuthRepository>(
    () => authRepositoryModule.apiAuthRepository(gh<_i10.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i9.UsersRepository>(
    () => usersRepositoryModule.getTestUsersRepository(
      gh<_i6.TestDataSource>(),
      gh<_i10.Dio>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i9.GetTripsUseCase>(
      () => tripUseCasesModule.getAllTripsUseCase(
            gh<_i9.TripsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i9.GetTripDetailsUseCase>(
      () => tripUseCasesModule.getTripDetailsUseCase(
            gh<_i9.TripsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i9.CompleteTripUseCase>(
      () => tripUseCasesModule.completeTripUseCase(
            gh<_i9.TripsRepository>(),
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i9.SignUpUseCase>(() => userUseCasesModule.signUpUseCase(
        gh<_i9.PreferencesRepository>(),
        gh<_i9.AuthRepository>(),
        gh<_i9.CurrentUserOutputPort>(),
        gh<_i9.ErrorHandlerOutputPort>(),
      ));
  gh.lazySingleton<_i9.LoginUseCase>(() => userUseCasesModule.loginUseCase(
        gh<_i9.PreferencesRepository>(),
        gh<_i9.AuthRepository>(),
        gh<_i9.CurrentUserOutputPort>(),
        gh<_i9.ErrorHandlerOutputPort>(),
      ));
  gh.lazySingleton<_i5.MyOwnRoutesTabController>(() => controllersModule
      .myOwnRoutesTabController(gh<_i9.GetMyOwnRoutesUseCase>()));
  gh.lazySingleton<_i5.SignUpPageController>(
      () => controllersModule.signUpPageController(gh<_i9.SignUpUseCase>()));
  gh.lazySingleton<_i5.RoutesTabController>(() =>
      controllersModule.getRoutesTabController(gh<_i9.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFiltersPageController>(() => controllersModule
      .getRouteFiltersPageController(gh<_i9.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFavoriteButtonController>(() =>
      controllersModule.getRouteFavoriteButtonController(
          gh<_i9.UpdateRouteFavoriteStatusUseCase>()));
  gh.lazySingleton<_i5.CreateRoutePageController>(
      () => controllersModule.createRoutePageController(
            gh<_i9.GetRoutePreviewUseCase>(),
            gh<_i9.CreateNewRouteUseCase>(),
          ));
  gh.lazySingleton<_i9.IsAuthorizedUseCase>(
      () => userUseCasesModule.getIsAuthorizedUseCase(
            gh<_i9.PreferencesRepository>(),
            gh<_i9.AuthRepository>(),
            gh<_i9.UsersRepository>(),
            gh<_i9.CurrentUserOutputPort>(),
          ));
  gh.lazySingleton<_i5.TripDetailsPageController>(
      () => controllersModule.getTripDetailsPageController(
            gh<_i9.GetTripDetailsUseCase>(),
            gh<_i9.CompleteTripUseCase>(),
          ));
  gh.lazySingleton<_i5.StartPageController>(
      () => controllersModule.startPageController(gh<_i9.LoginUseCase>()));
  gh.lazySingleton<_i9.CacheRouteUseCase>(
      () => routeUseCasesModule.cacheRouteUseCase(
            gh<_i9.ErrorHandlerOutputPort>(),
            gh<_i9.RoutesOutputPort>(),
            gh<_i9.CacheRepository>(),
            gh<_i9.UsersRepository>(),
          ));
  gh.lazySingleton<_i9.GetUserSubscriptionStatusUseCase>(
      () => userUseCasesModule.getUserSubscriptionStatus(
            gh<_i9.UsersRepository>(),
            gh<_i9.LocationsOutputPort>(),
            gh<_i9.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.TripsTabController>(
      () => controllersModule.getTripsTabController(gh<_i9.GetTripsUseCase>()));
  gh.lazySingleton<_i5.TripFiltersPageController>(() => controllersModule
      .getTripFiltersPageController(gh<_i9.GetTripsUseCase>()));
  gh.lazySingleton<_i9.GetUserByEmailUseCase>(
      () => userUseCasesModule.getUserByEmailUseCase(
            gh<_i9.UsersRepository>(),
            gh<_i9.UsersOutputPort>(),
            gh<_i9.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteMapPageController>(
      () => controllersModule.getRouteMapPageController(
            gh<_i9.CacheRouteUseCase>(),
            gh<_i9.GetRouteDetailsUseCase>(),
            gh<_i9.GetGeopositionUseCase>(),
          ));
  gh.lazySingleton<_i5.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i9.IsAuthorizedUseCase>(),
            gh<_i9.GetAllLocationsUseCase>(),
            gh<_i9.GetAllRoutesUseCase>(),
            gh<_i9.GetLocationsAvailableFiltersUseCase>(),
            gh<_i9.GetRoutesAvailableFiltersUseCase>(),
            gh<_i9.GetAppVersion>(),
            gh<_i9.GetTripsUseCase>(),
            gh<_i9.GetFavoriteLocationsUseCase>(),
            gh<_i9.GetFavoriteRoutesUseCase>(),
            gh<_i9.GetMyOwnRoutesUseCase>(),
            gh<_i9.GetCachedRoutesUseCase>(),
          ));
  gh.lazySingleton<_i5.CreateTripPageController>(
      () => controllersModule.createTripPageController(
            gh<_i9.GetUserByEmailUseCase>(),
            gh<_i9.RemoveUserFromCreatingTripUseCase>(),
            gh<_i9.SetTripRouteUseCase>(),
            gh<_i9.CreateTripUseCase>(),
          ));
  return getIt;
}

class _$DataPackagesModule extends _i11.DataPackagesModule {}

class _$AutoRouterModule extends _i12.AutoRouterModule {}

class _$BlocModule extends _i13.BlocModule {}

class _$DataSourceModule extends _i14.DataSourceModule {}

class _$FirebaseModule extends _i15.FirebaseModule {}

class _$GeopositionRepositoryModule extends _i16.GeopositionRepositoryModule {}

class _$ChatsRepositoryModule extends _i17.ChatsRepositoryModule {}

class _$PresentersModule extends _i18.PresentersModule {}

class _$PreferencesRepositoryModule extends _i19.PreferencesRepositoryModule {}

class _$AppSettingsRepositoryModule extends _i20.AppSettingsRepositoryModule {}

class _$UserUseCasesModule extends _i21.UserUseCasesModule {}

class _$CacheRepositoryModule extends _i22.CacheRepositoryModule {}

class _$LocationsRepositoryModule extends _i23.LocationsRepositoryModule {}

class _$RoutesRepositoryModule extends _i24.RoutesRepositoryModule {}

class _$ReviewsRepositoryModule extends _i25.ReviewsRepositoryModule {}

class _$ReviewUseCasesModule extends _i26.ReviewUseCasesModule {}

class _$TripUseCasesModule extends _i27.TripUseCasesModule {}

class _$GeopositionUseCasesModule extends _i28.GeopositionUseCasesModule {}

class _$LocationUseCasesCasesModule extends _i29.LocationUseCasesCasesModule {}

class _$DioModule extends _i30.DioModule {}

class _$ControllersModule extends _i31.ControllersModule {}

class _$TripsRepositoryModule extends _i32.TripsRepositoryModule {}

class _$RouteUseCasesModule extends _i33.RouteUseCasesModule {}

class _$SettingsUseCasesModule extends _i34.SettingsUseCasesModule {}

class _$AuthRepositoryModule extends _i35.AuthRepositoryModule {}

class _$UsersRepositoryModule extends _i36.UsersRepositoryModule {}
