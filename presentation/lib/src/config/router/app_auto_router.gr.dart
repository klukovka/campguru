// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:presentation/src/pages/home_page/home_page.dart' as _i1;
import 'package:presentation/src/pages/home_page/locations_tab/locations_tab.dart'
    as _i5;
import 'package:presentation/src/pages/home_page/profile_tab/profile_tab.dart'
    as _i6;
import 'package:presentation/src/pages/home_page/routes_tab/routes_tab.dart'
    as _i7;
import 'package:presentation/src/pages/home_page/trips_tab/trips_tab.dart'
    as _i10;
import 'package:presentation/src/pages/location_details_page/location_details_page.dart'
    as _i2;
import 'package:presentation/src/pages/location_map_page/location_map_page.dart'
    as _i3;
import 'package:presentation/src/pages/location_reviews_page/location_reviews_page.dart'
    as _i4;
import 'package:presentation/src/pages/splash_page/splash_page.dart' as _i8;
import 'package:presentation/src/pages/start_page/start_page.dart' as _i9;

abstract class $AppAutoRouter extends _i11.RootStackRouter {
  $AppAutoRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i1.HomePage()),
      );
    },
    LocationDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LocationDetailsRouteArgs>(
          orElse: () =>
              LocationDetailsRouteArgs(locationId: pathParams.getInt('id')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(
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
      return _i11.AutoRoutePage<dynamic>(
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
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(
            child: _i4.LocationReviewsPage(
          key: args.key,
          locationId: args.locationId,
        )),
      );
    },
    LocationsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i5.LocationsTab()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileTab(),
      );
    },
    RoutesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i7.RoutesTab()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i8.SplashPage()),
      );
    },
    StartRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.StartPage(),
      );
    },
    TripsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TripsTab(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LocationDetailsPage]
class LocationDetailsRoute
    extends _i11.PageRouteInfo<LocationDetailsRouteArgs> {
  LocationDetailsRoute({
    _i12.Key? key,
    required int locationId,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<LocationDetailsRouteArgs> page =
      _i11.PageInfo<LocationDetailsRouteArgs>(name);
}

class LocationDetailsRouteArgs {
  const LocationDetailsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i12.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationDetailsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i3.LocationMapPage]
class LocationMapRoute extends _i11.PageRouteInfo<LocationMapRouteArgs> {
  LocationMapRoute({
    _i12.Key? key,
    double lng = 0,
    double lat = 0,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<LocationMapRouteArgs> page =
      _i11.PageInfo<LocationMapRouteArgs>(name);
}

class LocationMapRouteArgs {
  const LocationMapRouteArgs({
    this.key,
    this.lng = 0,
    this.lat = 0,
  });

  final _i12.Key? key;

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
    extends _i11.PageRouteInfo<LocationReviewsRouteArgs> {
  LocationReviewsRoute({
    _i12.Key? key,
    required int locationId,
    List<_i11.PageRouteInfo>? children,
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

  static const _i11.PageInfo<LocationReviewsRouteArgs> page =
      _i11.PageInfo<LocationReviewsRouteArgs>(name);
}

class LocationReviewsRouteArgs {
  const LocationReviewsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i12.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationReviewsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i5.LocationsTab]
class LocationsRoute extends _i11.PageRouteInfo<void> {
  const LocationsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileTab]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RoutesTab]
class RoutesRoute extends _i11.PageRouteInfo<void> {
  const RoutesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.StartPage]
class StartRoute extends _i11.PageRouteInfo<void> {
  const StartRoute({List<_i11.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TripsTab]
class TripsRoute extends _i11.PageRouteInfo<void> {
  const TripsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TripsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TripsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
