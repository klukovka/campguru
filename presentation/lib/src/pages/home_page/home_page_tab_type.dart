import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:localizations/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/config/router/app_auto_router.gr.dart';

enum HomePageTabType {
  locations(route: LocationsRoute()),
  routes(route: RoutesRoute()),
  trips(route: TripsRoute()),
  profile(route: ProfileRoute());

  final PageRouteInfo route;

  const HomePageTabType({
    required this.route,
  });

  IconData get iconData => switch (this) {
        HomePageTabType.routes => MdiIcons.routes,
        HomePageTabType.trips => MdiIcons.campfire,
        HomePageTabType.profile => MdiIcons.accountCircle,
        HomePageTabType.locations => MdiIcons.mapMarker,
      };

  String getDisplayText(BuildContext context) => switch (this) {
        HomePageTabType.routes => context.strings.routes,
        HomePageTabType.trips => context.strings.trips,
        HomePageTabType.profile => context.strings.profile,
        HomePageTabType.locations => context.strings.locations,
      };
}
