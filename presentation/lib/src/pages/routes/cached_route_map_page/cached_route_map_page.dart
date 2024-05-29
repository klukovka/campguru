import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CachedRouteMapPage extends StatefulWidget implements AutoRouteWrapper {
  final int routeId;
  const CachedRouteMapPage({
    super.key,
    @PathParam('id') required this.routeId,
  });

  @override
  State<CachedRouteMapPage> createState() => _CachedRouteMapPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _CachedRouteMapPageState extends State<CachedRouteMapPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
