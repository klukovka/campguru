// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:data/data.dart' as _i6;
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i10;
import 'package:domain/domain.dart' as _i8;
import 'package:firebase_core/firebase_core.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:presentation/presentation.dart' as _i5;

import 'data_modules/app_settings_repository_module.dart' as _i20;
import 'data_modules/auth_repository_module.dart' as _i32;
import 'data_modules/cache_repository_module.dart' as _i22;
import 'data_modules/chats_repository_module.dart' as _i23;
import 'data_modules/data_packages_module.dart' as _i12;
import 'data_modules/data_source_module.dart' as _i15;
import 'data_modules/dio_module.dart' as _i11;
import 'data_modules/firebase_module.dart' as _i16;
import 'data_modules/geoposition_repository_module.dart' as _i17;
import 'data_modules/locations_repository_module.dart' as _i35;
import 'data_modules/preferences_repository_module.dart' as _i19;
import 'data_modules/reviews_repository_module.dart' as _i37;
import 'data_modules/routes_repository_module.dart' as _i36;
import 'data_modules/subscriptions_repository_module.dart' as _i29;
import 'data_modules/trips_repository_module.dart' as _i38;
import 'data_modules/users_repository_module.dart' as _i34;
import 'domain_modules/auth_use_cases_module.dart' as _i28;
import 'domain_modules/chats_use_cases_module.dart' as _i27;
import 'domain_modules/geoposition_use_cases_module.dart' as _i25;
import 'domain_modules/location_use_cases_module.dart' as _i40;
import 'domain_modules/review_use_cases_module.dart' as _i39;
import 'domain_modules/route_use_cases_module.dart' as _i30;
import 'domain_modules/settings_use_cases_module.dart' as _i26;
import 'domain_modules/subscriptions_use_cases_module.dart' as _i33;
import 'domain_modules/trip_use_cases_module.dart' as _i24;
import 'domain_modules/user_use_cases_module.dart' as _i21;
import 'presentation_modules/auto_router_module.dart' as _i13;
import 'presentation_modules/bloc_module.dart' as _i14;
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
  final dioModule = _$DioModule();
  final dataPackagesModule = _$DataPackagesModule();
  final autoRouterModule = _$AutoRouterModule();
  final blocModule = _$BlocModule();
  final dataSourceModule = _$DataSourceModule();
  final firebaseModule = _$FirebaseModule();
  final geopositionRepositoryModule = _$GeopositionRepositoryModule();
  final presentersModule = _$PresentersModule();
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final appSettingsRepositoryModule = _$AppSettingsRepositoryModule();
  final userUseCasesModule = _$UserUseCasesModule();
  final cacheRepositoryModule = _$CacheRepositoryModule();
  final chatsRepositoryModule = _$ChatsRepositoryModule();
  final tripUseCasesModule = _$TripUseCasesModule();
  final geopositionUseCasesModule = _$GeopositionUseCasesModule();
  final settingsUseCasesModule = _$SettingsUseCasesModule();
  final chatsUseCasesModule = _$ChatsUseCasesModule();
  final authUseCasesModule = _$AuthUseCasesModule();
  final subscriptionsRepositoryModule = _$SubscriptionsRepositoryModule();
  final routeUseCasesModule = _$RouteUseCasesModule();
  final controllersModule = _$ControllersModule();
  final authRepositoryModule = _$AuthRepositoryModule();
  final subscriptionsUseCasesModule = _$SubscriptionsUseCasesModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final routesRepositoryModule = _$RoutesRepositoryModule();
  final reviewsRepositoryModule = _$ReviewsRepositoryModule();
  final tripsRepositoryModule = _$TripsRepositoryModule();
  final reviewUseCasesModule = _$ReviewUseCasesModule();
  final locationUseCasesCasesModule = _$LocationUseCasesCasesModule();
  gh.factory<String>(() => dioModule.baseUrl);
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
  gh.lazySingleton<_i5.TripChatPageCubit>(() => blocModule.tripChatPageCubit);
  gh.lazySingleton<_i5.EditProfilePageCubit>(
      () => blocModule.editProfilePageCubit);
  gh.lazySingleton<_i5.SubscriptionPageCubit>(
      () => blocModule.subscriptionPageCubit);
  gh.lazySingleton<_i5.CreateReviewPageCubit>(
      () => blocModule.createReviewPageCubit);
  gh.lazySingleton<_i5.ResetPasswordPageCubit>(
      () => blocModule.resetPasswordPageCubit);
  gh.lazySingleton<_i5.ChangePasswordPageCubit>(
      () => blocModule.changePasswordPageCubit);
  await gh.lazySingletonAsync<_i6.HiveDataSource>(
    () => dataSourceModule.getHiveDataSource(),
    preResolve: true,
  );
  gh.lazySingleton<_i6.SubscriptionsDataSource>(
      () => dataSourceModule.subscriptionsDataSource());
  await gh.lazySingletonAsync<_i7.FirebaseApp>(
    () => firebaseModule.app(),
    preResolve: true,
  );
  gh.lazySingleton<_i8.GeopositionRepository>(
      () => geopositionRepositoryModule.geopositionRepository);
  gh.lazySingleton<_i8.ChatsOutputPort>(
      () => presentersModule.chatsOutputPort(gh<_i5.TripChatPageCubit>()));
  gh.lazySingleton<_i8.UsersOutputPort>(
      () => presentersModule.usersOutputPort(gh<_i5.CreateTripPageCubit>()));
  gh.lazySingleton<_i8.ReviewsOutputPort>(
      () => presentersModule.getReviewsOutputPort(
            gh<_i5.LocationReviewsPageCubit>(),
            gh<_i5.RouteReviewsPageCubit>(),
            gh<_i5.CreateReviewPageCubit>(),
          ));
  gh.lazySingleton<_i5.CampguruRouter>(
      () => autoRouterModule.router(gh<_i5.AppAutoRouter>()));
  gh.lazySingleton<_i8.CurrentUserOutputPort>(
      () => presentersModule.getCurrentUserOutputPort(
            gh<_i5.SplashPageCubit>(),
            gh<_i5.HomePageCubit>(),
            gh<_i5.ProfileTabCubit>(),
            gh<_i5.SignUpPageCubit>(),
            gh<_i5.StartPageCubit>(),
            gh<_i5.EditProfilePageCubit>(),
            gh<_i5.LocationsFiltersPageCubit>(),
            gh<_i5.RoutesFiltersPageCubit>(),
            gh<_i5.SubscriptionPageCubit>(),
            gh<_i5.ResetPasswordPageCubit>(),
            gh<_i5.ChangePasswordPageCubit>(),
          ));
  gh.lazySingleton<_i8.ErrorHandlerOutputPort>(() =>
      presentersModule.getErrorHandlerOutputPort(gh<_i5.AppControlCubit>()));
  gh.lazySingleton<_i8.SubscriptionsOutputPort>(() => presentersModule
      .subscriptionsOutputPort(gh<_i5.SubscriptionPageCubit>()));
  gh.lazySingleton<_i8.GeopositionOutputPort>(
      () => presentersModule.geopositionPresenter(
            gh<_i5.RouteMapPageCubit>(),
            gh<_i5.CachedRouteMapPageCubit>(),
          ));
  gh.lazySingleton<_i8.PreferencesRepository>(
    () => preferencesRepositoryModule
        .stablePreferencesRepository(gh<_i6.HiveDataSource>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i8.AppSettingsRepository>(() => appSettingsRepositoryModule
      .getAppSettingsRepository(gh<_i4.PackageInfo>()));
  gh.lazySingleton<_i8.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i6.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i9.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore(gh<_i7.FirebaseApp>()));
  gh.lazySingleton<_i8.RemoveUserFromCreatingTripUseCase>(() =>
      userUseCasesModule
          .removeUserFromCreatingTripUseCase(gh<_i8.UsersOutputPort>()));
  gh.lazySingleton<_i8.TripsOutputPort>(
      () => presentersModule.getTripsOutputPort(
            gh<_i5.TripsTabCubit>(),
            gh<_i5.TripsFiltersPageCubit>(),
            gh<_i5.TripDetailsPageCubit>(),
            gh<_i5.CreateTripPageCubit>(),
            gh<_i5.TripChatPageCubit>(),
          ));
  gh.lazySingleton<_i8.LocationsOutputPort>(
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
  gh.lazySingleton<_i8.RoutesOutputPort>(
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
  await gh.lazySingletonAsync<_i8.CacheRepository>(
    () => cacheRepositoryModule.getCacheRepository(gh<_i6.HiveDataSource>()),
    preResolve: true,
  );
  gh.lazySingleton<_i8.SettingsOutputPort>(
      () => presentersModule.getSettingsOutputPort(
            gh<_i5.ProfileTabCubit>(),
            gh<_i5.AppControlCubit>(),
          ));
  gh.lazySingleton<_i8.ChatsRepository>(
      () => chatsRepositoryModule.chatsRepository(gh<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i8.SetTripRouteUseCase>(
      () => tripUseCasesModule.setTripRouteUseCase(gh<_i8.TripsOutputPort>()));
  gh.lazySingleton<_i8.GetGeopositionUseCase>(
      () => geopositionUseCasesModule.getGeopositionUseCase(
            gh<_i8.GeopositionRepository>(),
            gh<_i8.GeopositionOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i6.AuthInterceptor>(
      () => dioModule.authInterceptor(gh<_i8.PreferencesRepository>()));
  gh.lazySingleton<_i8.GetInitialSettingsUseCase>(
      () => settingsUseCasesModule.getInitialSettingsUseCase(
            gh<_i8.PreferencesRepository>(),
            gh<_i8.SettingsOutputPort>(),
          ));
  gh.lazySingleton<_i8.ChangeLocaleUseCase>(
      () => settingsUseCasesModule.changeLocaleUseCase(
            gh<_i8.PreferencesRepository>(),
            gh<_i8.SettingsOutputPort>(),
          ));
  gh.lazySingleton<_i8.ChangeThemeModeUseCase>(
      () => settingsUseCasesModule.changeThemeModeUseCase(
            gh<_i8.PreferencesRepository>(),
            gh<_i8.SettingsOutputPort>(),
          ));
  gh.lazySingleton<_i8.SendMessageUseCase>(
      () => chatsUseCasesModule.sendMessageUseCase(
            gh<_i8.ChatsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.PreferencesRepository>(),
          ));
  gh.lazySingleton<_i8.LogoutUseCase>(() => authUseCasesModule.logoutUseCase(
        gh<_i8.PreferencesRepository>(),
        gh<_i8.CacheRepository>(),
      ));
  gh.lazySingleton<_i10.Dio>(
    () => dioModule.dio(
      gh<_i6.AuthInterceptor>(),
      gh<String>(),
    ),
    registerFor: {
      _test,
      _dev,
    },
  );
  gh.lazySingleton<_i8.SubscriptionsRepository>(
    () => subscriptionsRepositoryModule.testSubscriptionRepository(
      gh<_i10.Dio>(),
      gh<_i6.SubscriptionsDataSource>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i10.Dio>(
    () => dioModule.prodDio(
      gh<_i6.AuthInterceptor>(),
      gh<String>(),
    ),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i8.DeleteCachedRouteUseCase>(
      () => routeUseCasesModule.deleteCachedRouteUseCase(
            gh<_i8.CacheRepository>(),
            gh<_i8.RoutesOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetFirstMessagesPageUseCase>(
      () => chatsUseCasesModule.getFirstMessagesPageUseCase(
            gh<_i8.ChatsRepository>(),
            gh<_i8.PreferencesRepository>(),
            gh<_i8.ChatsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetCachedRouteDetailsUseCase>(
      () => routeUseCasesModule.getCachedRouteDetailsUseCase(
            gh<_i8.CacheRepository>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i5.CachedRouteDetailsPageController>(() =>
      controllersModule.cachedRouteDetailsPageController(
          gh<_i8.GetCachedRouteDetailsUseCase>()));
  gh.lazySingleton<_i5.CachedRouteMapPageController>(
      () => controllersModule.cachedRouteMapPageController(
            gh<_i8.GetCachedRouteDetailsUseCase>(),
            gh<_i8.GetGeopositionUseCase>(),
          ));
  gh.lazySingleton<_i8.GetAppVersion>(
      () => settingsUseCasesModule.getAppVersion(
            gh<_i8.AppSettingsRepository>(),
            gh<_i8.SettingsOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetNextMessagesPageUseCase>(
      () => chatsUseCasesModule.getNextMessagesPageUseCase(
            gh<_i8.ChatsRepository>(),
            gh<_i8.ChatsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.PreferencesRepository>(),
          ));
  gh.lazySingleton<_i8.GetPreviousMessagesPageUseCase>(
      () => chatsUseCasesModule.getPreviousMessagesPageUseCase(
            gh<_i8.ChatsRepository>(),
            gh<_i8.ChatsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.PreferencesRepository>(),
          ));
  gh.lazySingleton<_i8.GetNewMessagesStreamUseCase>(
      () => chatsUseCasesModule.getNewMessagesStreamUseCase(
            gh<_i8.ChatsRepository>(),
            gh<_i8.ChatsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.PreferencesRepository>(),
          ));
  gh.lazySingleton<_i8.AuthRepository>(
    () => authRepositoryModule.testAuthRepository(gh<_i10.Dio>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i8.CreateSubscriptionUseCase>(
      () => subscriptionsUseCasesModule.createSubscriptionUseCase(
            gh<_i8.SubscriptionsRepository>(),
            gh<_i8.SubscriptionsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.CurrentUserOutputPort>(),
          ));
  gh.lazySingleton<_i8.UsersRepository>(
    () => usersRepositoryModule.apiUsersRepository(gh<_i10.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i8.LocationsRepository>(
    () => locationsRepositoryModule.getApiLocationsRepository(gh<_i10.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i8.RoutesRepository>(
    () => routesRepositoryModule.getApiRoutesRepository(gh<_i10.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i8.ReviewsRepository>(
    () => reviewsRepositoryModule.getApiReviewsRepository(gh<_i10.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i8.AuthRepository>(
    () => authRepositoryModule.apiAuthRepository(gh<_i10.Dio>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i5.SubscriptionPageController>(() => controllersModule
      .subscriptionPageController(gh<_i8.CreateSubscriptionUseCase>()));
  gh.lazySingleton<_i8.GetAvailableSubscriptionsUseCase>(
      () => subscriptionsUseCasesModule.getAvailableSubscriptionsUseCase(
            gh<_i8.SubscriptionsRepository>(),
            gh<_i8.SubscriptionsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i8.UsersRepository>(
    () => usersRepositoryModule.getTestUsersRepository(
      gh<_i6.TestDataSource>(),
      gh<_i10.Dio>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i8.LocationsRepository>(
    () => locationsRepositoryModule.getTestLocationsRepository(
      gh<_i6.TestDataSource>(),
      gh<_i10.Dio>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i8.RoutesRepository>(
    () => routesRepositoryModule.getTestRoutesRepository(
      gh<_i6.TestDataSource>(),
      gh<_i10.Dio>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i8.ReviewsRepository>(
    () => reviewsRepositoryModule.getTestReviewsRepository(
      gh<_i6.TestDataSource>(),
      gh<_i10.Dio>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i8.TripsRepository>(
    () => tripsRepositoryModule.getTripsRepository(
      gh<_i6.TestDataSource>(),
      gh<_i10.Dio>(),
    ),
    registerFor: {_test},
  );
  gh.lazySingleton<_i8.GetCachedRoutesUseCase>(
      () => routeUseCasesModule.getCachedRoutesUseCase(
            gh<_i8.CacheRepository>(),
            gh<_i8.RoutesOutputPort>(),
            gh<_i8.UsersRepository>(),
          ));
  gh.lazySingleton<_i5.TripChatController>(
      () => controllersModule.tripChatController(
            gh<_i8.SendMessageUseCase>(),
            gh<_i8.GetFirstMessagesPageUseCase>(),
            gh<_i8.GetNextMessagesPageUseCase>(),
            gh<_i8.GetPreviousMessagesPageUseCase>(),
            gh<_i8.GetNewMessagesStreamUseCase>(),
          ));
  gh.lazySingleton<_i8.LoginUseCase>(() => authUseCasesModule.loginUseCase(
        gh<_i8.PreferencesRepository>(),
        gh<_i8.AuthRepository>(),
        gh<_i8.CurrentUserOutputPort>(),
        gh<_i8.ErrorHandlerOutputPort>(),
      ));
  gh.lazySingleton<_i8.SignUpUseCase>(() => authUseCasesModule.signUpUseCase(
        gh<_i8.PreferencesRepository>(),
        gh<_i8.AuthRepository>(),
        gh<_i8.CurrentUserOutputPort>(),
        gh<_i8.ErrorHandlerOutputPort>(),
      ));
  gh.lazySingleton<_i5.ProfileTabController>(
      () => controllersModule.profileTabController(
            gh<_i8.LogoutUseCase>(),
            gh<_i8.ChangeLocaleUseCase>(),
            gh<_i8.ChangeThemeModeUseCase>(),
          ));
  gh.lazySingleton<_i8.CreateTripUseCase>(
      () => tripUseCasesModule.createTripUseCase(
            gh<_i8.TripsRepository>(),
            gh<_i8.TripsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.ChatsRepository>(),
            gh<_i8.PreferencesRepository>(),
          ));
  gh.lazySingleton<_i8.SubscriptionsRepository>(
    () => subscriptionsRepositoryModule.apiSubscriptionRepository(
      gh<_i10.Dio>(),
      gh<_i6.SubscriptionsDataSource>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i8.IsAuthorizedUseCase>(
      () => authUseCasesModule.getIsAuthorizedUseCase(
            gh<_i8.PreferencesRepository>(),
            gh<_i8.AuthRepository>(),
            gh<_i8.UsersRepository>(),
            gh<_i8.CurrentUserOutputPort>(),
          ));
  gh.lazySingleton<_i8.ChangePasswordUseCase>(
      () => authUseCasesModule.changePasswordUseCase(
            gh<_i8.AuthRepository>(),
            gh<_i8.CurrentUserOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i8.ResetPasswordUseCase>(
      () => authUseCasesModule.resetPasswordUseCase(
            gh<_i8.AuthRepository>(),
            gh<_i8.CurrentUserOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.CachedRoutesTabController>(
      () => controllersModule.cachedRoutesTabController(
            gh<_i8.GetCachedRoutesUseCase>(),
            gh<_i8.DeleteCachedRouteUseCase>(),
          ));
  gh.lazySingleton<_i5.ChangePasswordPageController>(() => controllersModule
      .changePasswordPageController(gh<_i8.ChangePasswordUseCase>()));
  gh.lazySingleton<_i8.GetAllRoutesUseCase>(
      () => routeUseCasesModule.getAllRoutesUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.UpdateRouteFavoriteStatusUseCase>(
      () => routeUseCasesModule.getUpdateRouteFavoriteStatusUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetRouteDetailsUseCase>(
      () => routeUseCasesModule.getRouteDetailsUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetRoutesAvailableFiltersUseCase>(
      () => routeUseCasesModule.getRoutesAvailableFiltersUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.CreateNewRouteUseCase>(
      () => routeUseCasesModule.getCreateNewRouteUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetRoutePreviewUseCase>(
      () => routeUseCasesModule.getGetRoutePreviewUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetFavoriteRoutesUseCase>(
      () => routeUseCasesModule.getFavoriteRoutesUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetMyOwnRoutesUseCase>(
      () => routeUseCasesModule.getMyOwnRoutesUseCase(
            gh<_i8.RoutesRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i8.CreateReviewUseCase>(
      () => reviewUseCasesModule.createReviewUseCase(
            gh<_i8.ReviewsRepository>(),
            gh<_i8.ReviewsOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i8.EditProfileUseCase>(
      () => userUseCasesModule.editProfileUseCase(
            gh<_i8.UsersRepository>(),
            gh<_i8.CurrentUserOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i8.CacheRouteUseCase>(
      () => routeUseCasesModule.cacheRouteUseCase(
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.RoutesOutputPort>(),
            gh<_i8.CacheRepository>(),
            gh<_i8.UsersRepository>(),
          ));
  gh.lazySingleton<_i8.GetLocationReviewsUseCase>(
      () => reviewUseCasesModule.getLocationReviewsUseCase(
            gh<_i8.ReviewsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetRouteReviewsUseCase>(
      () => reviewUseCasesModule.getRouteReviewsUseCase(
            gh<_i8.ReviewsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteDetailsPageController>(() => controllersModule
      .getRouteDetailsPageController(gh<_i8.GetRouteDetailsUseCase>()));
  gh.lazySingleton<_i8.GetUserByEmailUseCase>(
      () => userUseCasesModule.getUserByEmailUseCase(
            gh<_i8.UsersRepository>(),
            gh<_i8.UsersOutputPort>(),
            gh<_i8.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i5.FavoriteRoutesTabController>(
      () => controllersModule.favoriteRoutesTabController(
            gh<_i8.GetFavoriteRoutesUseCase>(),
            gh<_i8.SetTripRouteUseCase>(),
          ));
  gh.factory<_i8.GetLocationsAvailableFiltersUseCase>(
      () => locationUseCasesCasesModule.getLocationsAvailableFiltersUseCase(
            gh<_i8.LocationsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetAllLocationsUseCase>(
      () => locationUseCasesCasesModule.getAllLocationsUseCase(
            gh<_i8.LocationsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i8.UpdateLocationFavoriteStatusUseCase>(
      () => locationUseCasesCasesModule.getUpdateLocationFavoriteStatusUseCase(
            gh<_i8.LocationsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetLocationDetailsUseCase>(
      () => locationUseCasesCasesModule.getLocationDetailsUseCase(
            gh<_i8.LocationsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetRouteLocationsUseCase>(
      () => locationUseCasesCasesModule.getRouteLocationsUseCase(
            gh<_i8.LocationsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetFavoriteLocationsUseCase>(
      () => locationUseCasesCasesModule.getFavoriteLocationsUseCase(
            gh<_i8.LocationsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i5.RouteMapPageController>(
      () => controllersModule.getRouteMapPageController(
            gh<_i8.CacheRouteUseCase>(),
            gh<_i8.GetRouteDetailsUseCase>(),
            gh<_i8.GetGeopositionUseCase>(),
          ));
  gh.lazySingleton<_i5.SignUpPageController>(
      () => controllersModule.signUpPageController(gh<_i8.SignUpUseCase>()));
  gh.lazySingleton<_i5.LocationDetailsPageController>(() => controllersModule
      .getLocationDetailsPageController(gh<_i8.GetLocationDetailsUseCase>()));
  gh.lazySingleton<_i5.LocationFavoriteButtonController>(() =>
      controllersModule.getLocationFavoriteButtonController(
          gh<_i8.UpdateLocationFavoriteStatusUseCase>()));
  gh.lazySingleton<_i5.CreateReviewPageController>(() => controllersModule
      .createReviewPageController(gh<_i8.CreateReviewUseCase>()));
  gh.lazySingleton<_i8.GetTripsUseCase>(
      () => tripUseCasesModule.getAllTripsUseCase(
            gh<_i8.TripsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i8.GetTripDetailsUseCase>(
      () => tripUseCasesModule.getTripDetailsUseCase(
            gh<_i8.TripsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i8.CompleteTripUseCase>(
      () => tripUseCasesModule.completeTripUseCase(
            gh<_i8.TripsRepository>(),
            gh<_i8.ErrorHandlerOutputPort>(),
            gh<_i8.TripsOutputPort>(),
          ));
  gh.lazySingleton<_i5.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i8.IsAuthorizedUseCase>(),
            gh<_i8.GetAllLocationsUseCase>(),
            gh<_i8.GetAllRoutesUseCase>(),
            gh<_i8.GetLocationsAvailableFiltersUseCase>(),
            gh<_i8.GetRoutesAvailableFiltersUseCase>(),
            gh<_i8.GetAppVersion>(),
            gh<_i8.GetTripsUseCase>(),
            gh<_i8.GetFavoriteLocationsUseCase>(),
            gh<_i8.GetFavoriteRoutesUseCase>(),
            gh<_i8.GetMyOwnRoutesUseCase>(),
            gh<_i8.GetCachedRoutesUseCase>(),
            gh<_i8.GetInitialSettingsUseCase>(),
            gh<_i8.GetAvailableSubscriptionsUseCase>(),
          ));
  gh.lazySingleton<_i5.ResetPasswordPageController>(() => controllersModule
      .resetPasswordPageController(gh<_i8.ResetPasswordUseCase>()));
  gh.lazySingleton<_i5.StartPageController>(
      () => controllersModule.startPageController(gh<_i8.LoginUseCase>()));
  gh.lazySingleton<_i5.LocationReviewsPageController>(() => controllersModule
      .getLocationReviewsPageController(gh<_i8.GetLocationReviewsUseCase>()));
  gh.lazySingleton<_i5.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i8.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i5.LocationFiltersPageController>(() => controllersModule
      .getLocationFiltersPageController(gh<_i8.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i5.EditProfilePageController>(() => controllersModule
      .editProfilePageController(gh<_i8.EditProfileUseCase>()));
  gh.lazySingleton<_i5.MyOwnRoutesTabController>(() => controllersModule
      .myOwnRoutesTabController(gh<_i8.GetMyOwnRoutesUseCase>()));
  gh.lazySingleton<_i5.RoutesTabController>(() =>
      controllersModule.getRoutesTabController(gh<_i8.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFiltersPageController>(() => controllersModule
      .getRouteFiltersPageController(gh<_i8.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i5.RouteFavoriteButtonController>(() =>
      controllersModule.getRouteFavoriteButtonController(
          gh<_i8.UpdateRouteFavoriteStatusUseCase>()));
  gh.lazySingleton<_i5.CreateRoutePageController>(
      () => controllersModule.createRoutePageController(
            gh<_i8.GetRoutePreviewUseCase>(),
            gh<_i8.CreateNewRouteUseCase>(),
          ));
  gh.lazySingleton<_i5.RouteReviewsPageController>(() => controllersModule
      .getRouteReviewsPageController(gh<_i8.GetRouteReviewsUseCase>()));
  gh.lazySingleton<_i5.CreateTripPageController>(
      () => controllersModule.createTripPageController(
            gh<_i8.GetUserByEmailUseCase>(),
            gh<_i8.RemoveUserFromCreatingTripUseCase>(),
            gh<_i8.SetTripRouteUseCase>(),
            gh<_i8.CreateTripUseCase>(),
          ));
  gh.lazySingleton<_i5.TripDetailsPageController>(
      () => controllersModule.getTripDetailsPageController(
            gh<_i8.GetTripDetailsUseCase>(),
            gh<_i8.CompleteTripUseCase>(),
          ));
  gh.lazySingleton<_i5.RouteLocationsPageController>(() => controllersModule
      .getRouteLocationsController(gh<_i8.GetRouteLocationsUseCase>()));
  gh.lazySingleton<_i5.TripsTabController>(
      () => controllersModule.getTripsTabController(gh<_i8.GetTripsUseCase>()));
  gh.lazySingleton<_i5.TripFiltersPageController>(() => controllersModule
      .getTripFiltersPageController(gh<_i8.GetTripsUseCase>()));
  gh.lazySingleton<_i5.FavoriteLocationsPageController>(() =>
      controllersModule.getFavoriteLocationsPageController(
          gh<_i8.GetFavoriteLocationsUseCase>()));
  return getIt;
}

class _$DioModule extends _i11.DioModule {}

class _$DataPackagesModule extends _i12.DataPackagesModule {}

class _$AutoRouterModule extends _i13.AutoRouterModule {}

class _$BlocModule extends _i14.BlocModule {}

class _$DataSourceModule extends _i15.DataSourceModule {}

class _$FirebaseModule extends _i16.FirebaseModule {}

class _$GeopositionRepositoryModule extends _i17.GeopositionRepositoryModule {}

class _$PresentersModule extends _i18.PresentersModule {}

class _$PreferencesRepositoryModule extends _i19.PreferencesRepositoryModule {}

class _$AppSettingsRepositoryModule extends _i20.AppSettingsRepositoryModule {}

class _$UserUseCasesModule extends _i21.UserUseCasesModule {}

class _$CacheRepositoryModule extends _i22.CacheRepositoryModule {}

class _$ChatsRepositoryModule extends _i23.ChatsRepositoryModule {}

class _$TripUseCasesModule extends _i24.TripUseCasesModule {}

class _$GeopositionUseCasesModule extends _i25.GeopositionUseCasesModule {}

class _$SettingsUseCasesModule extends _i26.SettingsUseCasesModule {}

class _$ChatsUseCasesModule extends _i27.ChatsUseCasesModule {}

class _$AuthUseCasesModule extends _i28.AuthUseCasesModule {}

class _$SubscriptionsRepositoryModule
    extends _i29.SubscriptionsRepositoryModule {}

class _$RouteUseCasesModule extends _i30.RouteUseCasesModule {}

class _$ControllersModule extends _i31.ControllersModule {}

class _$AuthRepositoryModule extends _i32.AuthRepositoryModule {}

class _$SubscriptionsUseCasesModule extends _i33.SubscriptionsUseCasesModule {}

class _$UsersRepositoryModule extends _i34.UsersRepositoryModule {}

class _$LocationsRepositoryModule extends _i35.LocationsRepositoryModule {}

class _$RoutesRepositoryModule extends _i36.RoutesRepositoryModule {}

class _$ReviewsRepositoryModule extends _i37.ReviewsRepositoryModule {}

class _$TripsRepositoryModule extends _i38.TripsRepositoryModule {}

class _$ReviewUseCasesModule extends _i39.ReviewUseCasesModule {}

class _$LocationUseCasesCasesModule extends _i40.LocationUseCasesCasesModule {}
