// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:presentation/src/pages/home_page/home_page.dart' as _i1;
import 'package:presentation/src/pages/home_page/locations_tab/locations_tab.dart'
    as _i5;
import 'package:presentation/src/pages/home_page/profile_tab/profile_tab.dart'
    as _i6;
import 'package:presentation/src/pages/home_page/routes_tab/routes_tab.dart'
    as _i11;
import 'package:presentation/src/pages/home_page/trips_tab/trips_tab.dart'
    as _i14;
import 'package:presentation/src/pages/location_details_page/location_details_page.dart'
    as _i2;
import 'package:presentation/src/pages/location_map_page/location_map_page.dart'
    as _i3;
import 'package:presentation/src/pages/location_reviews_page/location_reviews_page.dart'
    as _i4;
import 'package:presentation/src/pages/route_details_page/route_details_page.dart'
    as _i7;
import 'package:presentation/src/pages/route_locations_page/route_locations_page.dart'
    as _i8;
import 'package:presentation/src/pages/route_map_page/route_map_page.dart'
    as _i9;
import 'package:presentation/src/pages/route_reviews_page/route_reviews_page.dart'
    as _i10;
import 'package:presentation/src/pages/splash_page/splash_page.dart' as _i12;
import 'package:presentation/src/pages/start_page/start_page.dart' as _i13;

abstract class $AppAutoRouter extends _i15.RootStackRouter {
  $AppAutoRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i1.HomePage()),
      );
    },
    LocationDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LocationDetailsRouteArgs>(
          orElse: () =>
              LocationDetailsRouteArgs(locationId: pathParams.getInt('id')));
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i2.LocationDetailsPage(
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
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LocationMapPage(
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
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i4.LocationReviewsPage(
          key: args.key,
          locationId: args.locationId,
        )),
      );
    },
    LocationsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i5.LocationsTab()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileTab(),
      );
    },
    RouteDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteDetailsRouteArgs>(
          orElse: () =>
              RouteDetailsRouteArgs(routeId: pathParams.getInt('id')));
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i7.RouteDetailsPage(
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
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i8.RouteLocationsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RouteMapRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RouteMapPage(),
      );
    },
    RouteReviewsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteReviewsRouteArgs>(
          orElse: () =>
              RouteReviewsRouteArgs(routeId: pathParams.getInt('id')));
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i10.RouteReviewsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RoutesRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i11.RoutesTab()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i12.SplashPage()),
      );
    },
    StartRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.StartPage(),
      );
    },
    TripsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.TripsTab(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LocationDetailsPage]
class LocationDetailsRoute
    extends _i15.PageRouteInfo<LocationDetailsRouteArgs> {
  LocationDetailsRoute({
    _i16.Key? key,
    required int locationId,
    List<_i15.PageRouteInfo>? children,
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

  static const _i15.PageInfo<LocationDetailsRouteArgs> page =
      _i15.PageInfo<LocationDetailsRouteArgs>(name);
}

class LocationDetailsRouteArgs {
  const LocationDetailsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i16.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationDetailsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i3.LocationMapPage]
class LocationMapRoute extends _i15.PageRouteInfo<LocationMapRouteArgs> {
  LocationMapRoute({
    _i16.Key? key,
    double lng = 0,
    double lat = 0,
    List<_i15.PageRouteInfo>? children,
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

  static const _i15.PageInfo<LocationMapRouteArgs> page =
      _i15.PageInfo<LocationMapRouteArgs>(name);
}

class LocationMapRouteArgs {
  const LocationMapRouteArgs({
    this.key,
    this.lng = 0,
    this.lat = 0,
  });

  final _i16.Key? key;

  final double lng;

  final double lat;

  @override
  String toString() {
    return 'LocationMapRouteArgs{key: $key, lng: $lng, lat: $lat}';
  }
}

/// generated route for
/// [_i4.LocationReviewsPage]
class LocationReviewsRoute
    extends _i15.PageRouteInfo<LocationReviewsRouteArgs> {
  LocationReviewsRoute({
    _i16.Key? key,
    required int locationId,
    List<_i15.PageRouteInfo>? children,
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

  static const _i15.PageInfo<LocationReviewsRouteArgs> page =
      _i15.PageInfo<LocationReviewsRouteArgs>(name);
}

class LocationReviewsRouteArgs {
  const LocationReviewsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i16.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationReviewsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i5.LocationsTab]
class LocationsRoute extends _i15.PageRouteInfo<void> {
  const LocationsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileTab]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RouteDetailsPage]
class RouteDetailsRoute extends _i15.PageRouteInfo<RouteDetailsRouteArgs> {
  RouteDetailsRoute({
    _i16.Key? key,
    required int routeId,
    List<_i15.PageRouteInfo>? children,
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

  static const _i15.PageInfo<RouteDetailsRouteArgs> page =
      _i15.PageInfo<RouteDetailsRouteArgs>(name);
}

class RouteDetailsRouteArgs {
  const RouteDetailsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i16.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteDetailsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i8.RouteLocationsPage]
class RouteLocationsRoute extends _i15.PageRouteInfo<RouteLocationsRouteArgs> {
  RouteLocationsRoute({
    _i16.Key? key,
    required int routeId,
    List<_i15.PageRouteInfo>? children,
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

  static const _i15.PageInfo<RouteLocationsRouteArgs> page =
      _i15.PageInfo<RouteLocationsRouteArgs>(name);
}

class RouteLocationsRouteArgs {
  const RouteLocationsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i16.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteLocationsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i9.RouteMapPage]
class RouteMapRoute extends _i15.PageRouteInfo<void> {
  const RouteMapRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RouteMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'RouteMapRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RouteReviewsPage]
class RouteReviewsRoute extends _i15.PageRouteInfo<RouteReviewsRouteArgs> {
  RouteReviewsRoute({
    _i16.Key? key,
    required int routeId,
    List<_i15.PageRouteInfo>? children,
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

  static const _i15.PageInfo<RouteReviewsRouteArgs> page =
      _i15.PageInfo<RouteReviewsRouteArgs>(name);
}

class RouteReviewsRouteArgs {
  const RouteReviewsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i16.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteReviewsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i11.RoutesTab]
class RoutesRoute extends _i15.PageRouteInfo<void> {
  const RoutesRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.StartPage]
class StartRoute extends _i15.PageRouteInfo<void> {
  const StartRoute({List<_i15.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.TripsTab]
class TripsRoute extends _i15.PageRouteInfo<void> {
  const TripsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TripsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TripsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
