import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/routes/route_map_page/views/cache_route_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/domain_list_lat_lng_extension.dart';
import 'package:presentation/src/utils/extensions/google_list_lat_lng_extension.dart';
import 'package:presentation/src/utils/extensions/string_lat_lng_extension.dart';

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
      value: context.locator<RouteDetailsPageCubit>(),
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
      context.locator<RouteDetailsPageController>()(widget.routeId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteDetailsPageCubit, RouteDetailsPageState>(
      builder: (context, state) {
        final locations =
            state.route.locations?.toRouteParams().toMapParams() ?? [];
        final polyline =
            state.route.polyline?.toRouteParams().toMapParams() ?? [];
        final bounds = polyline.getBounds();
        return Scaffold(
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    FlutterMap(
                      mapController: _controller,
                      options: MapOptions(
                        initialCenter: bounds.center,
                        initialCameraFit: CameraFit.bounds(bounds: bounds),
                      ),
                      children: [
                        TileLayer(
                          userAgentPackageName: 'com.example.campguru',
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        ),
                        PolylineLayer(
                          polylines: [
                            Polyline(
                              points: polyline,
                              strokeWidth: 5,
                              strokeJoin: StrokeJoin.round,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        MarkerLayer(
                          markers: locations
                              .map(
                                (e) => Marker(
                                  point: e,
                                  rotate: false,
                                  child: Icon(
                                    MdiIcons.mapMarker,
                                    size: 32,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
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
                      CameraFit.bounds(bounds: bounds),
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
