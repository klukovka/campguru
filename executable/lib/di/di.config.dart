// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i5;
import 'package:domain/domain.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:presentation/presentation.dart' as _i4;

import 'data_modules/auth_repository_module.dart' as _i11;
import 'data_modules/data_source_module.dart' as _i9;
import 'data_modules/locations_repository_module.dart' as _i13;
import 'data_modules/preferences_repository_module.dart' as _i12;
import 'data_modules/reviews_repository_module.dart' as _i15;
import 'data_modules/routes_repository_module.dart' as _i14;
import 'data_modules/users_repository_module.dart' as _i10;
import 'domain_modules/location_use_cases_module.dart' as _i17;
import 'domain_modules/review_use_cases_module.dart' as _i16;
import 'domain_modules/route_use_cases_module.dart' as _i20;
import 'domain_modules/user_use_cases_module.dart' as _i18;
import 'presentation_modules/auto_router_module.dart' as _i7;
import 'presentation_modules/bloc_module.dart' as _i8;
import 'presentation_modules/controllers_module.dart' as _i19;
import 'presentation_modules/presenters_module.dart' as _i6;

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
  final presentersModule = _$PresentersModule();
  final autoRouterModule = _$AutoRouterModule();
  final blocModule = _$BlocModule();
  final dataSourceModule = _$DataSourceModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
  final authRepositoryModule = _$AuthRepositoryModule();
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final routesRepositoryModule = _$RoutesRepositoryModule();
  final reviewsRepositoryModule = _$ReviewsRepositoryModule();
  final reviewUseCasesModule = _$ReviewUseCasesModule();
  final locationUseCasesCasesModule = _$LocationUseCasesCasesModule();
  final userUseCasesModule = _$UserUseCasesModule();
  final controllersModule = _$ControllersModule();
  final routeUseCasesModule = _$RouteUseCasesModule();
  gh.lazySingleton<_i3.ErrorHandlerOutputPort>(
      () => presentersModule.getErrorHandlerOutputPort());
  gh.lazySingleton<_i4.AppAutoRouter>(
      () => autoRouterModule.getAppAutoRouter());
  gh.lazySingleton<_i4.SplashPageCubit>(() => blocModule.splashPageCubit);
  gh.lazySingleton<_i4.HomePageCubit>(() => blocModule.homePageCubit);
  gh.lazySingleton<_i4.LocationsTabCubit>(() => blocModule.locationsTabCubit);
  gh.lazySingleton<_i4.LocationDetailsPageCubit>(
      () => blocModule.locationDetailsPageCubit);
  gh.lazySingleton<_i4.LocationReviewsPageCubit>(
      () => blocModule.locationReviewsPageCubit);
  gh.lazySingleton<_i4.RoutesTabCubit>(() => blocModule.routesTabCubit);
  gh.lazySingleton<_i4.RouteDetailsPageCubit>(
      () => blocModule.routeDetailsPageCubit);
  gh.lazySingleton<_i4.RouteLocationsPageCubit>(
      () => blocModule.routeLocationsPageCubit);
  gh.lazySingleton<_i4.RouteReviewsPageCubit>(
      () => blocModule.routeReviewsPageCubit);
  await gh.lazySingletonAsync<_i5.HiveDataSource>(
    () => dataSourceModule.hiveDataSource,
    preResolve: true,
  );
  gh.lazySingleton<_i3.ReviewsOutputPort>(
      () => presentersModule.getReviewsOutputPort(
            gh<_i4.LocationReviewsPageCubit>(),
            gh<_i4.RouteReviewsPageCubit>(),
          ));
  gh.lazySingleton<_i3.RoutesOutputPort>(
      () => presentersModule.getRoutesOutputPort(
            gh<_i4.RoutesTabCubit>(),
            gh<_i4.RouteDetailsPageCubit>(),
          ));
  gh.lazySingleton<_i4.CampguruRouter>(
      () => autoRouterModule.router(gh<_i4.AppAutoRouter>()));
  gh.lazySingleton<_i3.CurrentUserOutputPort>(
      () => presentersModule.getCurrentUserOutputPort(
            gh<_i4.SplashPageCubit>(),
            gh<_i4.HomePageCubit>(),
          ));
  gh.lazySingleton<_i3.UsersRepository>(
    () => usersRepositoryModule.testUsersRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i5.TestDataSource>(
    () => dataSourceModule.testDataSource,
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.AuthRepository>(
    () => authRepositoryModule.testAuthRepository,
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i5.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.LocationsOutputPort>(
      () => presentersModule.getLocationsOutputPort(
            gh<_i4.LocationsTabCubit>(),
            gh<_i4.LocationDetailsPageCubit>(),
            gh<_i4.RouteLocationsPageCubit>(),
          ));
  gh.lazySingleton<_i3.LocationsRepository>(
    () => locationsRepositoryModule
        .getTestLocationsRepository(gh<_i5.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.RoutesRepository>(
    () => routesRepositoryModule
        .getTestRoutesRepository(gh<_i5.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.ReviewsRepository>(
    () => reviewsRepositoryModule
        .getTestReviewsRepository(gh<_i5.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.GetLocationReviewsUseCase>(
      () => reviewUseCasesModule.getLocationReviewsUseCase(
            gh<_i3.ReviewsRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i3.GetRouteReviewsUseCase>(
      () => reviewUseCasesModule.getRouteReviewsUseCase(
            gh<_i3.ReviewsRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i3.GetAllLocationsUseCase>(
      () => locationUseCasesCasesModule.getAllLocationsUseCase(
            gh<_i3.LocationsRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i3.UpdateLocationFavoriteStatusUseCase>(
      () => locationUseCasesCasesModule.getUpdateLocationFavoriteStatusUseCase(
            gh<_i3.LocationsRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i3.GetLocationDetailsUseCase>(
      () => locationUseCasesCasesModule.getLocationDetailsUseCase(
            gh<_i3.LocationsRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i3.GetRouteLocationsUseCase>(
      () => locationUseCasesCasesModule.getRouteLocationsUseCase(
            gh<_i3.LocationsRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i3.IsAuthorizedUseCase>(
      () => userUseCasesModule.getIsAuthorizedUseCase(
            gh<_i3.PreferencesRepository>(),
            gh<_i3.AuthRepository>(),
            gh<_i3.UsersRepository>(),
            gh<_i3.CurrentUserOutputPort>(),
            gh<_i3.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i4.LocationDetailsPageController>(() => controllersModule
      .getLocationDetailsPageController(gh<_i3.GetLocationDetailsUseCase>()));
  gh.lazySingleton<_i4.LocationFavoriteButtonController>(() =>
      controllersModule.getLocationFavoriteButtonController(
          gh<_i3.UpdateLocationFavoriteStatusUseCase>()));
  gh.lazySingleton<_i4.LocationReviewsPageController>(() => controllersModule
      .getLocationReviewsPageController(gh<_i3.GetLocationReviewsUseCase>()));
  gh.lazySingleton<_i4.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i3.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i4.RouteReviewsPageController>(() => controllersModule
      .getRouteReviewsPageController(gh<_i3.GetRouteReviewsUseCase>()));
  gh.lazySingleton<_i3.GetAllRoutesUseCase>(
      () => routeUseCasesModule.getAllRoutesUseCase(
            gh<_i3.RoutesRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i3.UpdateRouteFavoriteStatusUseCase>(
      () => routeUseCasesModule.getUpdateRouteFavoriteStatusUseCase(
            gh<_i3.RoutesRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i3.GetRouteDetailsUseCase>(
      () => routeUseCasesModule.getRouteDetailsUseCase(
            gh<_i3.RoutesRepository>(),
            gh<_i3.ErrorHandlerOutputPort>(),
            gh<_i3.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i4.RouteLocationsPageController>(() => controllersModule
      .getRouteLocationsController(gh<_i3.GetRouteLocationsUseCase>()));
  gh.lazySingleton<_i4.RouteDetailsPageController>(() => controllersModule
      .getRouteDetailsPageController(gh<_i3.GetRouteDetailsUseCase>()));
  gh.lazySingleton<_i4.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i3.IsAuthorizedUseCase>(),
            gh<_i3.GetAllLocationsUseCase>(),
            gh<_i3.GetAllRoutesUseCase>(),
          ));
  gh.lazySingleton<_i4.RoutesTabController>(() =>
      controllersModule.getRoutesTabController(gh<_i3.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i4.RouteFavoriteButtonController>(() =>
      controllersModule.getRouteFavoriteButtonController(
          gh<_i3.UpdateRouteFavoriteStatusUseCase>()));
  return getIt;
}

class _$PresentersModule extends _i6.PresentersModule {}

class _$AutoRouterModule extends _i7.AutoRouterModule {}

class _$BlocModule extends _i8.BlocModule {}

class _$DataSourceModule extends _i9.DataSourceModule {}

class _$UsersRepositoryModule extends _i10.UsersRepositoryModule {}

class _$AuthRepositoryModule extends _i11.AuthRepositoryModule {}

class _$PreferencesRepositoryModule extends _i12.PreferencesRepositoryModule {}

class _$LocationsRepositoryModule extends _i13.LocationsRepositoryModule {}

class _$RoutesRepositoryModule extends _i14.RoutesRepositoryModule {}

class _$ReviewsRepositoryModule extends _i15.ReviewsRepositoryModule {}

class _$ReviewUseCasesModule extends _i16.ReviewUseCasesModule {}

class _$LocationUseCasesCasesModule extends _i17.LocationUseCasesCasesModule {}

class _$UserUseCasesModule extends _i18.UserUseCasesModule {}

class _$ControllersModule extends _i19.ControllersModule {}

class _$RouteUseCasesModule extends _i20.RouteUseCasesModule {}
