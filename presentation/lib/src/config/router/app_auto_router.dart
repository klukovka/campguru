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
    AutoRoute(page: StartRoute.page, path: '/start'),
    AutoRoute(
      page: LocationDetailsRoute.page,
      path: '/home/locations/:id',
    ),
    AutoRoute(
      page: LocationReviewsRoute.page,
      path: '/home/locations/:id/reviews',
    ),
  ];
}
