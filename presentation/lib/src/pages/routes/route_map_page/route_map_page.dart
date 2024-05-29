import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/routes/route_map_page/views/cache_route_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class RouteMapPage extends StatefulWidget implements AutoRouteWrapper {
  final int routeId;
  const RouteMapPage({
    super.key,
    @PathParam('id') required this.routeId,
  });

  @override
  State<RouteMapPage> createState() => _RouteMapPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RouteMapPageCubit>(),
      child: this,
    );
  }
}

class _RouteMapPageState extends State<RouteMapPage> {
  late final MapController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MapController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<RouteMapPageController>().getDetails(widget.routeId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteMapPageCubit, RouteMapPageState>(
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    RouteMap(
                      controller: _controller,
                      isGeopositionEnabled: state.isGeopositionEnabled,
                      mapCurrentPosition: state.mapCurrentPosition,
                      locations: state.locations,
                      polyline: state.polyline,
                      bounds: state.bounds,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: ArrowCircleButton.back(
                          onPressed: context.appRouter.pop,
                        ),
                      ),
                    )
                  ],
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CacheRouteButton(route: state.route),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    _controller.fitCamera(
                      CameraFit.bounds(bounds: state.bounds),
                    );
                  },
                  child: Icon(MdiIcons.mapMarkerRadius),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
