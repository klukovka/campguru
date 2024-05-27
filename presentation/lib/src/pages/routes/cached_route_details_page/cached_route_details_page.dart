import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/routes/route_details_page/views/route_details_sliver_app_bar.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class CachedRouteDetailsPage extends StatefulWidget
    implements AutoRouteWrapper {
  final int routeId;

  const CachedRouteDetailsPage({
    super.key,
    @PathParam('id') required this.routeId,
  });

  @override
  State<CachedRouteDetailsPage> createState() => _CachedRouteDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _CachedRouteDetailsPageState extends State<CachedRouteDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          RouteDetailsSliverAppBar(
            route: state.route,
            //TODO: Push cached route map
            onStretch: () => context.appRouter.pushRouteMap(widget.routeId),
          ),
        ],
      ),
    );
  }
}
