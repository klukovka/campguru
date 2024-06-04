import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class CacheRouteButton extends StatelessWidget {
  final domain.Route route;

  const CacheRouteButton({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.locator<RouteMapPageController>().cache(route),
      icon: Icon(MdiIcons.cached),
      label: Text(context.strings.cache),
    );
  }
}
