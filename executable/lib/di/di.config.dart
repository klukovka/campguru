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
import 'data_modules/locations_repository_module.dart' as _i14;
import 'data_modules/preferences_repository_module.dart' as _i11;
import 'data_modules/reviews_repository_module.dart' as _i15;
import 'data_modules/routes_repository_module.dart' as _i16;
import 'data_modules/users_repository_module.dart' as _i12;
import 'domain_modules/location_use_cases_module.dart' as _i17;
import 'domain_modules/review_use_cases_module.dart' as _i19;
import 'domain_modules/route_use_cases_module.dart' as _i18;
import 'domain_modules/user_use_cases_module.dart' as _i13;
import 'presentation_modules/auto_router_module.dart' as _i6;
import 'presentation_modules/bloc_module.dart' as _i10;
import 'presentation_modules/controllers_module.dart' as _i20;
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
  final preferencesRepositoryModule = _$PreferencesRepositoryModule();
  final usersRepositoryModule = _$UsersRepositoryModule();
  final userUseCasesModule = _$UserUseCasesModule();
  final locationsRepositoryModule = _$LocationsRepositoryModule();
  final reviewsRepositoryModule = _$ReviewsRepositoryModule();
  final routesRepositoryModule = _$RoutesRepositoryModule();
  final locationUseCasesCasesModule = _$LocationUseCasesCasesModule();
  final routeUseCasesModule = _$RouteUseCasesModule();
  final reviewUseCasesModule = _$ReviewUseCasesModule();
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
  gh.lazySingleton<_i3.LocationDetailsPageCubit>(
      () => blocModule.locationDetailsPageCubit);
  gh.lazySingleton<_i3.LocationReviewsPageCubit>(
      () => blocModule.locationReviewsPageCubit);
  gh.lazySingleton<_i3.LocationsTabCubit>(() => blocModule.locationsTabCubit);
  gh.lazySingleton<_i4.PreferencesRepository>(
    () => preferencesRepositoryModule
        .testPreferencesRepository(gh<_i5.HiveDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i3.RouteDetailsPageCubit>(
      () => blocModule.routeDetailsPageCubit);
  gh.lazySingleton<_i3.RouteLocationsPageCubit>(
      () => blocModule.routeLocationsPageCubit);
  gh.lazySingleton<_i3.RouteReviewsPageCubit>(
      () => blocModule.routeReviewsPageCubit);
  gh.lazySingleton<_i3.RoutesTabCubit>(() => blocModule.routesTabCubit);
  gh.lazySingleton<_i3.SplashPageCubit>(() => blocModule.splashPageCubit);
  gh.lazySingleton<_i5.TestDataSource>(
    () => dataSourceModule.testDataSource,
    registerFor: {_test},
  );
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
      () => userUseCasesModule.getIsAuthorizedUseCase(
            gh<_i4.PreferencesRepository>(),
            gh<_i4.AuthRepository>(),
            gh<_i4.UsersRepository>(),
            gh<_i4.CurrentUserOutputPort>(),
            gh<_i4.ErrorHandlerOutputPort>(),
          ));
  gh.lazySingleton<_i4.LocationsOutputPort>(
      () => presentersModule.getLocationsOutputPort(
            gh<_i3.LocationsTabCubit>(),
            gh<_i3.LocationDetailsPageCubit>(),
            gh<_i3.RouteLocationsPageCubit>(),
          ));
  gh.lazySingleton<_i4.LocationsRepository>(
    () => locationsRepositoryModule
        .getTestLocationsRepository(gh<_i5.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.ReviewsOutputPort>(
      () => presentersModule.getReviewsOutputPort(
            gh<_i3.LocationReviewsPageCubit>(),
            gh<_i3.RouteReviewsPageCubit>(),
          ));
  gh.lazySingleton<_i4.ReviewsRepository>(
    () => reviewsRepositoryModule
        .getTestReviewsRepository(gh<_i5.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.RoutesOutputPort>(
      () => presentersModule.getRoutesOutputPort(
            gh<_i3.RoutesTabCubit>(),
            gh<_i3.RouteDetailsPageCubit>(),
          ));
  gh.lazySingleton<_i4.RoutesRepository>(
    () => routesRepositoryModule
        .getTestRoutesRepository(gh<_i5.TestDataSource>()),
    registerFor: {_test},
  );
  gh.lazySingleton<_i4.UpdateLocationFavoriteStatusUseCase>(
      () => locationUseCasesCasesModule.getUpdateLocationFavoriteStatusUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.UpdateRouteFavoriteStatusUseCase>(
      () => routeUseCasesModule.getUpdateRouteFavoriteStatusUseCase(
            gh<_i4.RoutesRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetAllLocationsUseCase>(
      () => locationUseCasesCasesModule.getAllLocationsUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetAllRoutesUseCase>(
      () => routeUseCasesModule.getAllRoutesUseCase(
            gh<_i4.RoutesRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetLocationDetailsUseCase>(
      () => locationUseCasesCasesModule.getLocationDetailsUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetLocationReviewsUseCase>(
      () => reviewUseCasesModule.getLocationReviewsUseCase(
            gh<_i4.ReviewsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetRouteDetailsUseCase>(
      () => routeUseCasesModule.getRouteDetailsUseCase(
            gh<_i4.RoutesRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.RoutesOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetRouteLocationsUseCase>(
      () => locationUseCasesCasesModule.getRouteLocationsUseCase(
            gh<_i4.LocationsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.LocationsOutputPort>(),
          ));
  gh.lazySingleton<_i4.GetRouteReviewsUseCase>(
      () => reviewUseCasesModule.getRouteReviewsUseCase(
            gh<_i4.ReviewsRepository>(),
            gh<_i4.ErrorHandlerOutputPort>(),
            gh<_i4.ReviewsOutputPort>(),
          ));
  gh.lazySingleton<_i3.LocationDetailsPageController>(() => controllersModule
      .getLocationDetailsPageController(gh<_i4.GetLocationDetailsUseCase>()));
  gh.lazySingleton<_i3.LocationFavoriteButtonController>(() =>
      controllersModule.getLocationFavoriteButtonController(
          gh<_i4.UpdateLocationFavoriteStatusUseCase>()));
  gh.lazySingleton<_i3.LocationReviewsPageController>(() => controllersModule
      .getLocationReviewsPageController(gh<_i4.GetLocationReviewsUseCase>()));
  gh.lazySingleton<_i3.LocationsTabController>(() => controllersModule
      .getLocationsTabController(gh<_i4.GetAllLocationsUseCase>()));
  gh.lazySingleton<_i3.RouteDetailsPageController>(() => controllersModule
      .getRouteDetailsPageController(gh<_i4.GetRouteDetailsUseCase>()));
  gh.lazySingleton<_i3.RouteFavoriteButtonController>(() =>
      controllersModule.getRouteFavoriteButtonController(
          gh<_i4.UpdateRouteFavoriteStatusUseCase>()));
  gh.lazySingleton<_i3.RouteLocationsPageController>(() => controllersModule
      .getRouteLocationsController(gh<_i4.GetRouteLocationsUseCase>()));
  gh.lazySingleton<_i3.RouteReviewsPageController>(() => controllersModule
      .getRouteReviewsPageController(gh<_i4.GetRouteReviewsUseCase>()));
  gh.lazySingleton<_i3.RoutesTabController>(() =>
      controllersModule.getRoutesTabController(gh<_i4.GetAllRoutesUseCase>()));
  gh.lazySingleton<_i3.SplashPageController>(
      () => controllersModule.getSplashPageController(
            gh<_i4.IsAuthorizedUseCase>(),
            gh<_i4.GetAllLocationsUseCase>(),
            gh<_i4.GetAllRoutesUseCase>(),
          ));
  return getIt;
}

class _$AutoRouterModule extends _i6.AutoRouterModule {}

class _$AuthRepositoryModule extends _i7.AuthRepositoryModule {}

class _$PresentersModule extends _i8.PresentersModule {}

class _$DataSourceModule extends _i9.DataSourceModule {}

class _$BlocModule extends _i10.BlocModule {}

class _$PreferencesRepositoryModule extends _i11.PreferencesRepositoryModule {}

class _$UsersRepositoryModule extends _i12.UsersRepositoryModule {}

class _$UserUseCasesModule extends _i13.UserUseCasesModule {}

class _$LocationsRepositoryModule extends _i14.LocationsRepositoryModule {}

class _$ReviewsRepositoryModule extends _i15.ReviewsRepositoryModule {}

class _$RoutesRepositoryModule extends _i16.RoutesRepositoryModule {}

class _$LocationUseCasesCasesModule extends _i17.LocationUseCasesCasesModule {}

class _$RouteUseCasesModule extends _i18.RouteUseCasesModule {}

class _$ReviewUseCasesModule extends _i19.ReviewUseCasesModule {}

class _$ControllersModule extends _i20.ControllersModule {}
