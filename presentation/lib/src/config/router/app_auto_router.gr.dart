// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
import 'package:presentation/src/pages/home_page/home_page.dart' as _i3;
import 'package:presentation/src/pages/home_page/locations_tab/locations_tab.dart'
    as _i8;
import 'package:presentation/src/pages/home_page/profile_tab/profile_tab.dart'
    as _i9;
import 'package:presentation/src/pages/home_page/routes_tab/routes_tab.dart'
    as _i15;
import 'package:presentation/src/pages/home_page/trips_tab/trips_tab.dart'
    as _i20;
import 'package:presentation/src/pages/locations/favorite_locations_page/favorite_locations_page.dart'
    as _i2;
import 'package:presentation/src/pages/locations/location_details_page/location_details_page.dart'
    as _i4;
import 'package:presentation/src/pages/locations/location_map_page/location_map_page.dart'
    as _i5;
import 'package:presentation/src/pages/locations/locations_filters_page/locations_filters_page.dart'
    as _i7;
import 'package:presentation/src/pages/locations/route_locations_page/route_locations_page.dart'
    as _i11;
import 'package:presentation/src/pages/reviews/location_reviews_page/location_reviews_page.dart'
    as _i6;
import 'package:presentation/src/pages/reviews/route_reviews_page/route_reviews_page.dart'
    as _i13;
import 'package:presentation/src/pages/routes/create_route_page/create_route_page.dart'
    as _i1;
import 'package:presentation/src/pages/routes/route_details_page/route_details_page.dart'
    as _i10;
import 'package:presentation/src/pages/routes/route_map_page/route_map_page.dart'
    as _i12;
import 'package:presentation/src/pages/routes/routes_filters_page/routes_filters_page.dart'
    as _i14;
import 'package:presentation/src/pages/splash_page/splash_page.dart' as _i16;
import 'package:presentation/src/pages/start_page/start_page.dart' as _i17;
import 'package:presentation/src/pages/trips/trip_details_page/trip_details_page.dart'
    as _i18;
import 'package:presentation/src/pages/trips/trips_filters_page/trips_filters_page.dart'
    as _i19;

abstract class $AppAutoRouter extends _i21.RootStackRouter {
  $AppAutoRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    CreateRouteRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateRoutePage(),
      );
    },
    FavoriteLocationsRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i2.FavoriteLocationsPage()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i3.HomePage()),
      );
    },
    LocationDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LocationDetailsRouteArgs>(
          orElse: () =>
              LocationDetailsRouteArgs(locationId: pathParams.getInt('id')));
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i4.LocationDetailsPage(
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
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LocationMapPage(
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
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i6.LocationReviewsPage(
          key: args.key,
          locationId: args.locationId,
        )),
      );
    },
    LocationsFiltersRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i7.LocationsFiltersPage()),
      );
    },
    LocationsRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i8.LocationsTab()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i9.ProfileTab()),
      );
    },
    RouteDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteDetailsRouteArgs>(
          orElse: () =>
              RouteDetailsRouteArgs(routeId: pathParams.getInt('id')));
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i10.RouteDetailsPage(
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
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i11.RouteLocationsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RouteMapRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RouteMapRouteArgs>(
          orElse: () => RouteMapRouteArgs(routeId: pathParams.getInt('id')));
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i12.RouteMapPage(
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
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i13.RouteReviewsPage(
          key: args.key,
          routeId: args.routeId,
        )),
      );
    },
    RoutesFiltersRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i14.RoutesFiltersPage()),
      );
    },
    RoutesRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i15.RoutesTab()),
      );
    },
    SplashRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i16.SplashPage()),
      );
    },
    StartRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.StartPage(),
      );
    },
    TripDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TripDetailsRouteArgs>(
          orElse: () => TripDetailsRouteArgs(tripId: pathParams.getInt('id')));
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(
            child: _i18.TripDetailsPage(
          key: args.key,
          tripId: args.tripId,
        )),
      );
    },
    TripsFiltersRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i19.TripsFiltersPage()),
      );
    },
    TripsRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.WrappedRoute(child: const _i20.TripsTab()),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateRoutePage]
class CreateRouteRoute extends _i21.PageRouteInfo<void> {
  const CreateRouteRoute({List<_i21.PageRouteInfo>? children})
      : super(
          CreateRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRouteRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoriteLocationsPage]
class FavoriteLocationsRoute extends _i21.PageRouteInfo<void> {
  const FavoriteLocationsRoute({List<_i21.PageRouteInfo>? children})
      : super(
          FavoriteLocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteLocationsRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i21.PageRouteInfo<void> {
  const HomeRoute({List<_i21.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LocationDetailsPage]
class LocationDetailsRoute
    extends _i21.PageRouteInfo<LocationDetailsRouteArgs> {
  LocationDetailsRoute({
    _i22.Key? key,
    required int locationId,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<LocationDetailsRouteArgs> page =
      _i21.PageInfo<LocationDetailsRouteArgs>(name);
}

class LocationDetailsRouteArgs {
  const LocationDetailsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i22.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationDetailsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i5.LocationMapPage]
class LocationMapRoute extends _i21.PageRouteInfo<LocationMapRouteArgs> {
  LocationMapRoute({
    _i22.Key? key,
    double lng = 0,
    double lat = 0,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<LocationMapRouteArgs> page =
      _i21.PageInfo<LocationMapRouteArgs>(name);
}

class LocationMapRouteArgs {
  const LocationMapRouteArgs({
    this.key,
    this.lng = 0,
    this.lat = 0,
  });

  final _i22.Key? key;

  final double lng;

  final double lat;

  @override
  String toString() {
    return 'LocationMapRouteArgs{key: $key, lng: $lng, lat: $lat}';
  }
}

/// generated route for
/// [_i6.LocationReviewsPage]
class LocationReviewsRoute
    extends _i21.PageRouteInfo<LocationReviewsRouteArgs> {
  LocationReviewsRoute({
    _i22.Key? key,
    required int locationId,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<LocationReviewsRouteArgs> page =
      _i21.PageInfo<LocationReviewsRouteArgs>(name);
}

class LocationReviewsRouteArgs {
  const LocationReviewsRouteArgs({
    this.key,
    required this.locationId,
  });

  final _i22.Key? key;

  final int locationId;

  @override
  String toString() {
    return 'LocationReviewsRouteArgs{key: $key, locationId: $locationId}';
  }
}

/// generated route for
/// [_i7.LocationsFiltersPage]
class LocationsFiltersRoute extends _i21.PageRouteInfo<void> {
  const LocationsFiltersRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LocationsFiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsFiltersRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LocationsTab]
class LocationsRoute extends _i21.PageRouteInfo<void> {
  const LocationsRoute({List<_i21.PageRouteInfo>? children})
      : super(
          LocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileTab]
class ProfileRoute extends _i21.PageRouteInfo<void> {
  const ProfileRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RouteDetailsPage]
class RouteDetailsRoute extends _i21.PageRouteInfo<RouteDetailsRouteArgs> {
  RouteDetailsRoute({
    _i22.Key? key,
    required int routeId,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<RouteDetailsRouteArgs> page =
      _i21.PageInfo<RouteDetailsRouteArgs>(name);
}

class RouteDetailsRouteArgs {
  const RouteDetailsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i22.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteDetailsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i11.RouteLocationsPage]
class RouteLocationsRoute extends _i21.PageRouteInfo<RouteLocationsRouteArgs> {
  RouteLocationsRoute({
    _i22.Key? key,
    required int routeId,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<RouteLocationsRouteArgs> page =
      _i21.PageInfo<RouteLocationsRouteArgs>(name);
}

class RouteLocationsRouteArgs {
  const RouteLocationsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i22.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteLocationsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i12.RouteMapPage]
class RouteMapRoute extends _i21.PageRouteInfo<RouteMapRouteArgs> {
  RouteMapRoute({
    _i22.Key? key,
    required int routeId,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<RouteMapRouteArgs> page =
      _i21.PageInfo<RouteMapRouteArgs>(name);
}

class RouteMapRouteArgs {
  const RouteMapRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i22.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteMapRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i13.RouteReviewsPage]
class RouteReviewsRoute extends _i21.PageRouteInfo<RouteReviewsRouteArgs> {
  RouteReviewsRoute({
    _i22.Key? key,
    required int routeId,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<RouteReviewsRouteArgs> page =
      _i21.PageInfo<RouteReviewsRouteArgs>(name);
}

class RouteReviewsRouteArgs {
  const RouteReviewsRouteArgs({
    this.key,
    required this.routeId,
  });

  final _i22.Key? key;

  final int routeId;

  @override
  String toString() {
    return 'RouteReviewsRouteArgs{key: $key, routeId: $routeId}';
  }
}

/// generated route for
/// [_i14.RoutesFiltersPage]
class RoutesFiltersRoute extends _i21.PageRouteInfo<void> {
  const RoutesFiltersRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RoutesFiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesFiltersRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RoutesTab]
class RoutesRoute extends _i21.PageRouteInfo<void> {
  const RoutesRoute({List<_i21.PageRouteInfo>? children})
      : super(
          RoutesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RoutesRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SplashPage]
class SplashRoute extends _i21.PageRouteInfo<void> {
  const SplashRoute({List<_i21.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i17.StartPage]
class StartRoute extends _i21.PageRouteInfo<void> {
  const StartRoute({List<_i21.PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.TripDetailsPage]
class TripDetailsRoute extends _i21.PageRouteInfo<TripDetailsRouteArgs> {
  TripDetailsRoute({
    _i22.Key? key,
    required int tripId,
    List<_i21.PageRouteInfo>? children,
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

  static const _i21.PageInfo<TripDetailsRouteArgs> page =
      _i21.PageInfo<TripDetailsRouteArgs>(name);
}

class TripDetailsRouteArgs {
  const TripDetailsRouteArgs({
    this.key,
    required this.tripId,
  });

  final _i22.Key? key;

  final int tripId;

  @override
  String toString() {
    return 'TripDetailsRouteArgs{key: $key, tripId: $tripId}';
  }
}

/// generated route for
/// [_i19.TripsFiltersPage]
class TripsFiltersRoute extends _i21.PageRouteInfo<void> {
  const TripsFiltersRoute({List<_i21.PageRouteInfo>? children})
      : super(
          TripsFiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'TripsFiltersRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i20.TripsTab]
class TripsRoute extends _i21.PageRouteInfo<void> {
  const TripsRoute({List<_i21.PageRouteInfo>? children})
      : super(
          TripsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TripsRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}
