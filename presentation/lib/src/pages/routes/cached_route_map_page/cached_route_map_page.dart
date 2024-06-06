import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

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
    return BlocProvider.value(
      value: context.locator<CachedRouteMapPageCubit>(),
      child: this,
    );
  }
}

class _CachedRouteMapPageState extends State<CachedRouteMapPage> {
  late final MapController _controller;

  @override
  void initState() {
    super.initState();

    _controller = MapController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<CachedRouteMapPageController>()(widget.routeId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CachedRouteMapPageCubit, CachedRouteMapPageState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              RouteMap(
                controller: _controller,
                isGeopositionEnabled: state.isGeopositionEnabled,
                mapCurrentPosition: state.mapCurrentPosition,
                locations: state.locations,
                polyline: state.polyline,
                bounds: state.bounds,
                tileProvider:
                    FMTCStore('Route${widget.routeId}').getTileProvider(),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: IconCircleButton.arrowBack(
                    onPressed: context.appRouter.pop,
                  ),
                ),
              )
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FloatingActionButton(
              onPressed: () {
                _controller.fitCamera(
                  CameraFit.bounds(bounds: state.bounds),
                );
              },
              child: Icon(MdiIcons.mapMarkerRadius),
            ),
          ),
        );
      },
    );
  }
}
