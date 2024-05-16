import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/config/router/app_auto_router.gr.dart';

enum MyRoutesPageTabType {
  cached(route: CachedRoutesRoute()),
  favorites(route: FavoriteRoutesRoute()),
  myOwn(route: MyOwnRoutesRoute());

  final PageRouteInfo route;

  const MyRoutesPageTabType({
    required this.route,
  });

  IconData get iconData => switch (this) {
        MyRoutesPageTabType.favorites => MdiIcons.heart,
        MyRoutesPageTabType.cached => MdiIcons.cached,
        MyRoutesPageTabType.myOwn => MdiIcons.account,
      };

  //TODO: Add localization
  String getDisplayText(BuildContext context) => switch (this) {
        MyRoutesPageTabType.favorites => 'Favorites',
        MyRoutesPageTabType.cached => 'Cached',
        MyRoutesPageTabType.myOwn => 'My Own',
      };
}
