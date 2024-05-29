import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_auto_router.gr.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

Route<T> popUpRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return CupertinoModalPopupRoute(
    builder: (context) => Align(
      alignment: Alignment.center,
      child: Center(child: child),
    ),
    settings: page,
    barrierColor: Colors.black.withOpacity(0.75),
    barrierDismissible: false,
  );
}

@AutoRouterConfig(
  replaceInRouteName: 'Page|Tab|Dialog,Route',
)
class AppAutoRouter extends $AppAutoRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: _fadeIn,
        durationInMilliseconds: _durationInMilliseconds,
      );
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
    AutoRoute(
      page: SignUpRoute.page,
      path: '/sign_up',
    ),
    AutoRoute(page: StartRoute.page, path: '/start'),
    AutoRoute(page: HomeRoute.page, path: '/home/', children: [
      AutoRoute(
        page: LocationsRoute.page,
        path: 'locations',
        initial: true,
      ),
      AutoRoute(page: RoutesRoute.page, path: 'routes'),
      AutoRoute(page: TripsRoute.page, path: 'trips'),
      AutoRoute(page: ProfileRoute.page, path: 'profile'),
    ]),
    AutoRoute(
      page: LocationsFiltersRoute.page,
      path: '/home/locations/filters',
    ),
    AutoRoute(
      page: RoutesFiltersRoute.page,
      path: '/home/routes/filters',
    ),
    AutoRoute(
      page: TripsFiltersRoute.page,
      path: '/home/trips/filters',
    ),
    AutoRoute(
      page: LocationDetailsRoute.page,
      path: '/home/locations/:id',
    ),
    AutoRoute(
      page: LocationReviewsRoute.page,
      path: '/home/locations/:id/reviews',
    ),
    AutoRoute(
      page: LocationMapRoute.page,
      path: '/home/locations?lng={lng}&&lat={lat}',
    ),
    AutoRoute(
      page: RouteDetailsRoute.page,
      path: '/home/routes/:id',
    ),
    AutoRoute(
      page: RouteLocationsRoute.page,
      path: '/home/routes/:id/locations',
    ),
    AutoRoute(
      page: RouteReviewsRoute.page,
      path: '/home/routes/:id/reviews',
    ),
    AutoRoute(
      page: RouteMapRoute.page,
      path: '/home/routes/:id/map',
    ),
    AutoRoute(
      page: TripDetailsRoute.page,
      path: '/home/trips/:id',
    ),
    AutoRoute(
      page: FavoriteLocationsRoute.page,
      path: '/home/profile/favorite_locations',
    ),
    AutoRoute(
      page: CreateRouteRoute.page,
      path: '/home/routes/create',
    ),
    AutoRoute(
      page: SelectableLocationsRoute.page,
      path: '/home/routes/create/location',
    ),
    AutoRoute(page: MyRoutesRoute.page, path: '/home/my_routes/', children: [
      AutoRoute(
        page: CachedRoutesRoute.page,
        path: 'cached',
        initial: true,
      ),
      AutoRoute(page: FavoriteRoutesRoute.page, path: 'favorites'),
      AutoRoute(page: MyOwnRoutesRoute.page, path: 'my_own'),
    ]),
    CustomRoute(
      page: AppUnexpectedErrorRoute.page,
      path: '/unexpected_error?title={title}&&message={message}',
      customRouteBuilder: popUpRouteBuilder,
      fullscreenDialog: true,
      opaque: false,
    ),
    AutoRoute(
      page: CachedRouteDetailsRoute.page,
      path: '/home/my_routes/cached/:id',
    ),
    AutoRoute(
      page: CachedRouteMapRoute.page,
      path: '/home/my_routes/cached/:id/map',
    ),
  ];
}
