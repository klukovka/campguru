import 'package:auto_route/auto_route.dart';

import 'app_auto_router.gr.dart';

const _durationInMilliseconds = 250;
const _fadeIn = TransitionsBuilders.fadeIn;

@AutoRouterConfig(
  replaceInRouteName: 'Page|Tab,Route',
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
    AutoRoute(page: StartRoute.page, path: '/start'),
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
      path: '/home/routes?locations={locations}&&polyline={polyline}',
    )
  ];
}
