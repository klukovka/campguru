// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i40;
import 'package:domain/domain.dart' as _i41;
import 'package:flutter/material.dart' as _i42;
import 'package:presentation/src/dialogs/app_unexpected_error_dialog.dart'
    as _i1;
import 'package:presentation/src/dialogs/language_dialog.dart' as _i13;
import 'package:presentation/src/dialogs/theme_dialog.dart' as _i35;
import 'package:presentation/src/pages/auth/reset_password_page/reset_password_page.dart'
    as _i22;
import 'package:presentation/src/pages/auth/sign_up_page/sign_up_page.dart'
    as _i31;
import 'package:presentation/src/pages/auth/start_page/start_page.dart' as _i33;
import 'package:presentation/src/pages/home_page/home_page.dart' as _i12;
import 'package:presentation/src/pages/home_page/locations_tab/locations_tab.dart'
    as _i18;
import 'package:presentation/src/pages/home_page/profile_tab/profile_tab.dart'
    as _i21;
import 'package:presentation/src/pages/home_page/routes_tab/routes_tab.dart'
    as _i28;
import 'package:presentation/src/pages/home_page/trips_tab/trips_tab.dart'
    as _i39;
import 'package:presentation/src/pages/locations/favorite_locations_page/favorite_locations_page.dart'
    as _i10;
import 'package:presentation/src/pages/locations/favorite_locations_page/selectable_locations_page.dart'
    as _i29;
import 'package:presentation/src/pages/locations/location_details_page/location_details_page.dart'
    as _i14;
import 'package:presentation/src/pages/locations/location_map_page/location_map_page.dart'
    as _i15;
import 'package:presentation/src/pages/locations/locations_filters_page/locations_filters_page.dart'
    as _i17;
import 'package:presentation/src/pages/locations/route_locations_page/route_locations_page.dart'
    as _i24;
import 'package:presentation/src/pages/reviews/create_review_page/create_location_review_page.dart'
    as _i5;
import 'package:presentation/src/pages/reviews/create_review_page/create_route_review_page.dart'
    as _i7;
import 'package:presentation/src/pages/reviews/location_reviews_page/location_reviews_page.dart'
    as _i16;
import 'package:presentation/src/pages/reviews/route_reviews_page/route_reviews_page.dart'
    as _i26;
import 'package:presentation/src/pages/routes/cached_route_details_page/cached_route_details_page.dart'
    as _i2;
import 'package:presentation/src/pages/routes/cached_route_map_page/cached_route_map_page.dart'
    as _i3;
import 'package:presentation/src/pages/routes/create_route_page/create_route_page.dart'
    as _i6;
import 'package:presentation/src/pages/routes/my_routes_page/cached_routes_tab/cached_routes_tab.dart'
    as _i4;
import 'package:presentation/src/pages/routes/my_routes_page/favorite_routes_tab/favorite_routes_tab.dart'
    as _i11;
import 'package:presentation/src/pages/routes/my_routes_page/my_own_routes_tab/my_own_routes_tab.dart'
    as _i19;
import 'package:presentation/src/pages/routes/my_routes_page/my_routes_page.dart'
    as _i20;
import 'package:presentation/src/pages/routes/route_details_page/route_details_page.dart'
    as _i23;
import 'package:presentation/src/pages/routes/route_map_page/route_map_page.dart'
    as _i25;
import 'package:presentation/src/pages/routes/routes_filters_page/routes_filters_page.dart'
    as _i27;
import 'package:presentation/src/pages/routes/selectable_routes_page/selectable_routes_page.dart'
    as _i30;
import 'package:presentation/src/pages/splash_page/splash_page.dart' as _i32;
import 'package:presentation/src/pages/trips/create_trip_page/create_trip_page.dart'
    as _i8;
import 'package:presentation/src/pages/trips/trip_chat_page/trip_chat_page.dart'
    as _i36;
import 'package:presentation/src/pages/trips/trip_details_page/trip_details_page.dart'
    as _i37;
import 'package:presentation/src/pages/trips/trips_filters_page/trips_filters_page.dart'
    as _i38;
import 'package:presentation/src/pages/user/edit_profile_page/edit_profile_page.dart'
    as _i9;
import 'package:presentation/src/pages/user/subscription_page/subscription_page.dart'
    as _i34;

abstract class $AppAutoRouter extends _i40.RootStackRouter {
  $AppAutoRouter({super.navigatorKey});

  @override
  final Map<String, _i40.PageFactory> pagesMap = {
    AppUnexpectedErrorRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AppUnexpectedErrorRouteArgs>(
          orElse: () => AppUnexpectedErrorRouteArgs(
                title: pathParams.getString('title'),
                message: pathParams.getString(
                  'message',
                  '',
                ),
              ));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AppUnexpectedErrorDialog(
          key: args.key,
          title: args.title,
          message: args.message,
        ),
      );
    },
    CachedRouteDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CachedRouteDetailsRouteArgs>(
          orElse: () =>
              CachedRouteDetailsRouteArgs(routeId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i2.CachedRouteDetailsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    CachedRouteMapRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CachedRouteMapRouteArgs>(
          orElse: () =>
              CachedRouteMapRouteArgs(routeId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i3.CachedRouteMapPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    CachedRoutesRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i4.CachedRoutesTab()),
      );
    },
    CreateLocationReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateLocationReviewRouteArgs>(
          orElse: () =>
              CreateLocationReviewRouteArgs(id: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CreateLocationReviewPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CreateRouteRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i6.CreateRoutePage()),
      );
    },
    CreateRouteReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateRouteReviewRouteArgs>(
          orElse: () =>
              CreateRouteReviewRouteArgs(id: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CreateRouteReviewPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CreateTripRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i8.CreateTripPage()),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i9.EditProfilePage()),
      );
    },
    FavoriteLocationsRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i10.FavoriteLocationsPage()),
      );
    },
    FavoriteRoutesRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i11.FavoriteRoutesTab()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i12.HomePage()),
      );
    },
    LanguageRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LanguageDialog(),
      );
    },
    LocationDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LocationDetailsRouteArgs>(
          orElse: () =>
              LocationDetailsRouteArgs(locationId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i14.LocationDetailsPage(
          key: args.key,
          locationId: args.locationId,
        )),
      );
    },
    LocationMapRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<LocationMapRouteArgs>(
          orElse: () => LocationMapRouteArgs(
                lng: queryParams.getDouble(
                  'lng',
                  0,
                ),
                lat: queryParams.getDouble(
                  'lat',
                  0,
                ),
              ));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.LocationMapPage(
          key: args.key,
          lng: args.lng,
          lat: args.lat,
        ),
      );
    },
    LocationReviewsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LocationReviewsRouteArgs>(
          orElse: () =>
              LocationReviewsRouteArgs(locationId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i16.LocationReviewsPage(
          key: args.key,
          locationId: args.locationId,
        )),
      );
    },
    LocationsFiltersRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i17.LocationsFiltersPage()),
      );
    },
    LocationsRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i18.LocationsTab()),
      );
    },
    MyOwnRoutesRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i19.MyOwnRoutesTab()),
      );
    },
    MyRoutesRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.MyRoutesPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i21.ProfileTab()),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i22.ResetPasswordPage()),
      );
    },
    RouteDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteDetailsRouteArgs>(
          orElse: () =>
              RouteDetailsRouteArgs(routeId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i23.RouteDetailsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RouteLocationsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteLocationsRouteArgs>(
          orElse: () =>
              RouteLocationsRouteArgs(routeId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i24.RouteLocationsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RouteMapRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteMapRouteArgs>(
          orElse: () => RouteMapRouteArgs(routeId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i25.RouteMapPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RouteReviewsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteReviewsRouteArgs>(
          orElse: () =>
              RouteReviewsRouteArgs(routeId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i26.RouteReviewsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RoutesFiltersRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i27.RoutesFiltersPage()),
      );
    },
    RoutesRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i28.RoutesTab()),
      );
    },
    SelectableLocationsRoute.name: (routeData) {
      final args = routeData.argsAs<SelectableLocationsRouteArgs>();
      return _i40.AutoRoutePage<List<_i41.Location>>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i29.SelectableLocationsPage(
          key: args.key,
          selectedLocations: args.selectedLocations,
        )),
      );
    },
    SelectableRoutesRoute.name: (routeData) {
      final args = routeData.argsAs<SelectableRoutesRouteArgs>(
          orElse: () => const SelectableRoutesRouteArgs());
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i30.SelectableRoutesPage(
          key: args.key,
          route: args.route,
        )),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i31.SignUpPage()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i32.SplashPage()),
      );
    },
    StartRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i33.StartPage()),
      );
    },
    SubscriptionRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i34.SubscriptionPage()),
      );
    },
    ThemeRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.ThemeDialog(),
      );
    },
    TripChatRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TripChatRouteArgs>(
          orElse: () => TripChatRouteArgs(tripId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i36.TripChatPage(
          key: args.key,
          tripId: args.tripId,
        )),
      );
    },
    TripDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TripDetailsRouteArgs>(
          orElse: () => TripDetailsRouteArgs(tripId: pathParams.getInt('id')));
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(
            child: _i37.TripDetailsPage(
          key: args.key,
          tripId: args.tripId,
        )),
      );
    },
    TripsFiltersRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i38.TripsFiltersPage()),
      );
    },
    TripsRoute.name: (routeData) {
      return _i40.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WrappedRoute(child: const _i39.TripsTab()),
      );
    },
  };
}

/// generated route for
/// [_i1.AppUnexpectedErrorDialog]
class AppUnexpectedErrorRoute
    extends _i40.PageRouteInfo<AppUnexpectedErrorRouteArgs> {
  AppUnexpectedErrorRoute({
    _i42.Key? key,
    required String title,
    String message = '',
    List<_i40.PageRouteInfo>? children,
  }) : super(
          AppUnexpectedErrorRoute.name,
          args: AppUnexpectedErrorRouteArgs(
            key: key,
            title: title,
            message: message,
          ),
          rawPathParams: {
            'title': title,
            'message': message,
          },
          initialChildren: children,
        );

  static const String name = 'AppUnexpectedErrorRoute';

  static const _i40.PageInfo<AppUnexpectedErrorRouteArgs> page =
      _i40.PageInfo<AppUnexpectedErrorRouteArgs>(name);
}

class AppUnexpectedErrorRouteArgs {
  const AppUnexpectedErrorRouteArgs({
    this.key,
    required this.title,
    this.message = '',
  });

  final _i42.Key? key;

  final String title;

  final String message;

  @override
  String toString() {
    return 'AppUnexpectedErrorRouteArgs{key: $key, title: $title, message: $message}';
  }
}

/// generated route for
/// [_i2.CachedRouteDetailsPage]
class CachedRouteDetailsRoute
    extends _i40.PageRouteInfo<CachedRouteDetailsRouteArgs> {
  CachedRouteDetailsRoute({
    _i42.Key? key,
    required int routeId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          CachedRouteDetailsRoute.name,
          args: CachedRouteDetailsRouteArgs(
            key: key,
            routeId: routeId,
          ),
          rawPathParams: {'id': routeId},
          initialChildren: children,
        );

  static const String name = 'CachedRouteDetailsRoute';

  static const _i40.PageInfo<CachedRouteDetailsRouteArgs> page =
      _i40.PageInfo<CachedRouteDetailsRouteArgs>(name);
}

class CachedRouteDetailsRouteArgs {
  const CachedRouteDetailsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i42.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'CachedRouteDetailsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i3.CachedRouteMapPage]
class CachedRouteMapRoute extends _i40.PageRouteInfo<CachedRouteMapRouteArgs> {
  CachedRouteMapRoute({
    _i42.Key? key,
    required int routeId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          CachedRouteMapRoute.name,
          args: CachedRouteMapRouteArgs(
            key: key,
            routeId: routeId,
          ),
          rawPathParams: {'id': routeId},
          initialChildren: children,
        );

  static const String name = 'CachedRouteMapRoute';

  static const _i40.PageInfo<CachedRouteMapRouteArgs> page =
      _i40.PageInfo<CachedRouteMapRouteArgs>(name);
}

class CachedRouteMapRouteArgs {
  const CachedRouteMapRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i42.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'CachedRouteMapRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i4.CachedRoutesTab]
class CachedRoutesRoute extends _i40.PageRouteInfo<void> {
  const CachedRoutesRoute({List<_i40.PageRouteInfo>? children})
      : super(
          CachedRoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CachedRoutesRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CreateLocationReviewPage]
class CreateLocationReviewRoute
    extends _i40.PageRouteInfo<CreateLocationReviewRouteArgs> {
  CreateLocationReviewRoute({
    _i42.Key? key,
    required int id,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          CreateLocationReviewRoute.name,
          args: CreateLocationReviewRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CreateLocationReviewRoute';

  static const _i40.PageInfo<CreateLocationReviewRouteArgs> page =
      _i40.PageInfo<CreateLocationReviewRouteArgs>(name);
}

class CreateLocationReviewRouteArgs {
  const CreateLocationReviewRouteArgs({
    this.key,
    required this.id,
  });

  final _i42.Key? key;

  final int id;

  @override
  String toString() {
    return 'CreateLocationReviewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.CreateRoutePage]
class CreateRouteRoute extends _i40.PageRouteInfo<void> {
  const CreateRouteRoute({List<_i40.PageRouteInfo>? children})
      : super(
          CreateRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRouteRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreateRouteReviewPage]
class CreateRouteReviewRoute
    extends _i40.PageRouteInfo<CreateRouteReviewRouteArgs> {
  CreateRouteReviewRoute({
    _i42.Key? key,
    required int id,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          CreateRouteReviewRoute.name,
          args: CreateRouteReviewRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CreateRouteReviewRoute';

  static const _i40.PageInfo<CreateRouteReviewRouteArgs> page =
      _i40.PageInfo<CreateRouteReviewRouteArgs>(name);
}

class CreateRouteReviewRouteArgs {
  const CreateRouteReviewRouteArgs({
    this.key,
    required this.id,
  });

  final _i42.Key? key;

  final int id;

  @override
  String toString() {
    return 'CreateRouteReviewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i8.CreateTripPage]
class CreateTripRoute extends _i40.PageRouteInfo<void> {
  const CreateTripRoute({List<_i40.PageRouteInfo>? children})
      : super(
          CreateTripRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTripRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EditProfilePage]
class EditProfileRoute extends _i40.PageRouteInfo<void> {
  const EditProfileRoute({List<_i40.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i10.FavoriteLocationsPage]
class FavoriteLocationsRoute extends _i40.PageRouteInfo<void> {
  const FavoriteLocationsRoute({List<_i40.PageRouteInfo>? children})
      : super(
          FavoriteLocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteLocationsRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i11.FavoriteRoutesTab]
class FavoriteRoutesRoute extends _i40.PageRouteInfo<void> {
  const FavoriteRoutesRoute({List<_i40.PageRouteInfo>? children})
      : super(
          FavoriteRoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoutesRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomePage]
class HomeRoute extends _i40.PageRouteInfo<void> {
  const HomeRoute({List<_i40.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i13.LanguageDialog]
class LanguageRoute extends _i40.PageRouteInfo<void> {
  const LanguageRoute({List<_i40.PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i14.LocationDetailsPage]
class LocationDetailsRoute
    extends _i40.PageRouteInfo<LocationDetailsRouteArgs> {
  LocationDetailsRoute({
    _i42.Key? key,
    required int locationId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          LocationDetailsRoute.name,
          args: LocationDetailsRouteArgs(
            key: key,
            locationId: locationId,
          ),
          rawPathParams: {'id': locationId},
          initialChildren: children,
        );

  static const String name = 'LocationDetailsRoute';

  static const _i40.PageInfo<LocationDetailsRouteArgs> page =
      _i40.PageInfo<LocationDetailsRouteArgs>(name);
}

class LocationDetailsRouteArgs {
  const LocationDetailsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i42.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationDetailsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i15.LocationMapPage]
class LocationMapRoute extends _i40.PageRouteInfo<LocationMapRouteArgs> {
  LocationMapRoute({
    _i42.Key? key,
    double lng = 0,
    double lat = 0,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          LocationMapRoute.name,
          args: LocationMapRouteArgs(
            key: key,
            lng: lng,
            lat: lat,
          ),
          rawQueryParams: {
            'lng': lng,
            'lat': lat,
          },
          initialChildren: children,
        );

  static const String name = 'LocationMapRoute';

  static const _i40.PageInfo<LocationMapRouteArgs> page =
      _i40.PageInfo<LocationMapRouteArgs>(name);
}

class LocationMapRouteArgs {
  const LocationMapRouteArgs({
    this.key,
    this.lng = 0,
    this.lat = 0,
  });

  final _i42.Key? key;

  final double lng;

  final double lat;

  @override
  String toString() {
    return 'LocationMapRouteArgs{key: $key, lng: $lng, lat: $lat}';
  }
}

/// generated route for
/// [_i16.LocationReviewsPage]
class LocationReviewsRoute
    extends _i40.PageRouteInfo<LocationReviewsRouteArgs> {
  LocationReviewsRoute({
    _i42.Key? key,
    required int locationId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          LocationReviewsRoute.name,
          args: LocationReviewsRouteArgs(
            key: key,
            locationId: locationId,
          ),
          rawPathParams: {'id': locationId},
          initialChildren: children,
        );

  static const String name = 'LocationReviewsRoute';

  static const _i40.PageInfo<LocationReviewsRouteArgs> page =
      _i40.PageInfo<LocationReviewsRouteArgs>(name);
}

class LocationReviewsRouteArgs {
  const LocationReviewsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i42.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationReviewsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i17.LocationsFiltersPage]
class LocationsFiltersRoute extends _i40.PageRouteInfo<void> {
  const LocationsFiltersRoute({List<_i40.PageRouteInfo>? children})
      : super(
          LocationsFiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsFiltersRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i18.LocationsTab]
class LocationsRoute extends _i40.PageRouteInfo<void> {
  const LocationsRoute({List<_i40.PageRouteInfo>? children})
      : super(
          LocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i19.MyOwnRoutesTab]
class MyOwnRoutesRoute extends _i40.PageRouteInfo<void> {
  const MyOwnRoutesRoute({List<_i40.PageRouteInfo>? children})
      : super(
          MyOwnRoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyOwnRoutesRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i20.MyRoutesPage]
class MyRoutesRoute extends _i40.PageRouteInfo<void> {
  const MyRoutesRoute({List<_i40.PageRouteInfo>? children})
      : super(
          MyRoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyRoutesRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ProfileTab]
class ProfileRoute extends _i40.PageRouteInfo<void> {
  const ProfileRoute({List<_i40.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ResetPasswordPage]
class ResetPasswordRoute extends _i40.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i40.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i23.RouteDetailsPage]
class RouteDetailsRoute extends _i40.PageRouteInfo<RouteDetailsRouteArgs> {
  RouteDetailsRoute({
    _i42.Key? key,
    required int routeId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          RouteDetailsRoute.name,
          args: RouteDetailsRouteArgs(
            key: key,
            routeId: routeId,
          ),
          rawPathParams: {'id': routeId},
          initialChildren: children,
        );

  static const String name = 'RouteDetailsRoute';

  static const _i40.PageInfo<RouteDetailsRouteArgs> page =
      _i40.PageInfo<RouteDetailsRouteArgs>(name);
}

class RouteDetailsRouteArgs {
  const RouteDetailsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i42.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteDetailsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i24.RouteLocationsPage]
class RouteLocationsRoute extends _i40.PageRouteInfo<RouteLocationsRouteArgs> {
  RouteLocationsRoute({
    _i42.Key? key,
    required int routeId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          RouteLocationsRoute.name,
          args: RouteLocationsRouteArgs(
            key: key,
            routeId: routeId,
          ),
          rawPathParams: {'id': routeId},
          initialChildren: children,
        );

  static const String name = 'RouteLocationsRoute';

  static const _i40.PageInfo<RouteLocationsRouteArgs> page =
      _i40.PageInfo<RouteLocationsRouteArgs>(name);
}

class RouteLocationsRouteArgs {
  const RouteLocationsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i42.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteLocationsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i25.RouteMapPage]
class RouteMapRoute extends _i40.PageRouteInfo<RouteMapRouteArgs> {
  RouteMapRoute({
    _i42.Key? key,
    required int routeId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          RouteMapRoute.name,
          args: RouteMapRouteArgs(
            key: key,
            routeId: routeId,
          ),
          rawPathParams: {'id': routeId},
          initialChildren: children,
        );

  static const String name = 'RouteMapRoute';

  static const _i40.PageInfo<RouteMapRouteArgs> page =
      _i40.PageInfo<RouteMapRouteArgs>(name);
}

class RouteMapRouteArgs {
  const RouteMapRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i42.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteMapRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i26.RouteReviewsPage]
class RouteReviewsRoute extends _i40.PageRouteInfo<RouteReviewsRouteArgs> {
  RouteReviewsRoute({
    _i42.Key? key,
    required int routeId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          RouteReviewsRoute.name,
          args: RouteReviewsRouteArgs(
            key: key,
            routeId: routeId,
          ),
          rawPathParams: {'id': routeId},
          initialChildren: children,
        );

  static const String name = 'RouteReviewsRoute';

  static const _i40.PageInfo<RouteReviewsRouteArgs> page =
      _i40.PageInfo<RouteReviewsRouteArgs>(name);
}

class RouteReviewsRouteArgs {
  const RouteReviewsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i42.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteReviewsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i27.RoutesFiltersPage]
class RoutesFiltersRoute extends _i40.PageRouteInfo<void> {
  const RoutesFiltersRoute({List<_i40.PageRouteInfo>? children})
      : super(
          RoutesFiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesFiltersRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i28.RoutesTab]
class RoutesRoute extends _i40.PageRouteInfo<void> {
  const RoutesRoute({List<_i40.PageRouteInfo>? children})
      : super(
          RoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SelectableLocationsPage]
class SelectableLocationsRoute
    extends _i40.PageRouteInfo<SelectableLocationsRouteArgs> {
  SelectableLocationsRoute({
    _i42.Key? key,
    required List<_i41.Location> selectedLocations,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          SelectableLocationsRoute.name,
          args: SelectableLocationsRouteArgs(
            key: key,
            selectedLocations: selectedLocations,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectableLocationsRoute';

  static const _i40.PageInfo<SelectableLocationsRouteArgs> page =
      _i40.PageInfo<SelectableLocationsRouteArgs>(name);
}

class SelectableLocationsRouteArgs {
  const SelectableLocationsRouteArgs({
    this.key,
    required this.selectedLocations,
  });

  final _i42.Key? key;

  final List<_i41.Location> selectedLocations;

  @override
  String toString() {
    return 'SelectableLocationsRouteArgs{key: $key, selectedLocations: $selectedLocations}';
  }
}

/// generated route for
/// [_i30.SelectableRoutesPage]
class SelectableRoutesRoute
    extends _i40.PageRouteInfo<SelectableRoutesRouteArgs> {
  SelectableRoutesRoute({
    _i42.Key? key,
    _i41.Route? route,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          SelectableRoutesRoute.name,
          args: SelectableRoutesRouteArgs(
            key: key,
            route: route,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectableRoutesRoute';

  static const _i40.PageInfo<SelectableRoutesRouteArgs> page =
      _i40.PageInfo<SelectableRoutesRouteArgs>(name);
}

class SelectableRoutesRouteArgs {
  const SelectableRoutesRouteArgs({
    this.key,
    this.route,
  });

  final _i42.Key? key;

  final _i41.Route? route;

  @override
  String toString() {
    return 'SelectableRoutesRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [_i31.SignUpPage]
class SignUpRoute extends _i40.PageRouteInfo<void> {
  const SignUpRoute({List<_i40.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i32.SplashPage]
class SplashRoute extends _i40.PageRouteInfo<void> {
  const SplashRoute({List<_i40.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i33.StartPage]
class StartRoute extends _i40.PageRouteInfo<void> {
  const StartRoute({List<_i40.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i34.SubscriptionPage]
class SubscriptionRoute extends _i40.PageRouteInfo<void> {
  const SubscriptionRoute({List<_i40.PageRouteInfo>? children})
      : super(
          SubscriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i35.ThemeDialog]
class ThemeRoute extends _i40.PageRouteInfo<void> {
  const ThemeRoute({List<_i40.PageRouteInfo>? children})
      : super(
          ThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i36.TripChatPage]
class TripChatRoute extends _i40.PageRouteInfo<TripChatRouteArgs> {
  TripChatRoute({
    _i42.Key? key,
    required int tripId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          TripChatRoute.name,
          args: TripChatRouteArgs(
            key: key,
            tripId: tripId,
          ),
          rawPathParams: {'id': tripId},
          initialChildren: children,
        );

  static const String name = 'TripChatRoute';

  static const _i40.PageInfo<TripChatRouteArgs> page =
      _i40.PageInfo<TripChatRouteArgs>(name);
}

class TripChatRouteArgs {
  const TripChatRouteArgs({
    this.key,
    required this.tripId,
  });

  final _i42.Key? key;

  final int tripId;

  @override
  String toString() {
    return 'TripChatRouteArgs{key: $key, tripId: $tripId}';
  }
}

/// generated route for
/// [_i37.TripDetailsPage]
class TripDetailsRoute extends _i40.PageRouteInfo<TripDetailsRouteArgs> {
  TripDetailsRoute({
    _i42.Key? key,
    required int tripId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
          TripDetailsRoute.name,
          args: TripDetailsRouteArgs(
            key: key,
            tripId: tripId,
          ),
          rawPathParams: {'id': tripId},
          initialChildren: children,
        );

  static const String name = 'TripDetailsRoute';

  static const _i40.PageInfo<TripDetailsRouteArgs> page =
      _i40.PageInfo<TripDetailsRouteArgs>(name);
}

class TripDetailsRouteArgs {
  const TripDetailsRouteArgs({
    this.key,
    required this.tripId,
  });

  final _i42.Key? key;

  final int tripId;

  @override
  String toString() {
    return 'TripDetailsRouteArgs{key: $key, tripId: $tripId}';
  }
}

/// generated route for
/// [_i38.TripsFiltersPage]
class TripsFiltersRoute extends _i40.PageRouteInfo<void> {
  const TripsFiltersRoute({List<_i40.PageRouteInfo>? children})
      : super(
          TripsFiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'TripsFiltersRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}

/// generated route for
/// [_i39.TripsTab]
class TripsRoute extends _i40.PageRouteInfo<void> {
  const TripsRoute({List<_i40.PageRouteInfo>? children})
      : super(
          TripsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TripsRoute';

  static const _i40.PageInfo<void> page = _i40.PageInfo<void>(name);
}
