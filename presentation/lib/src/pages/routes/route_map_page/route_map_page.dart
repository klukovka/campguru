import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/google_list_lat_lng_extension.dart';
import 'package:presentation/src/utils/extensions/string_lat_lng_extension.dart';

@RoutePage()
class RouteMapPage extends StatefulWidget {
  final String locations;
  final String polyline;

  const RouteMapPage({
    super.key,
    @QueryParam() this.locations = '',
    @QueryParam() this.polyline = '',
  });

  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
  late final MapController _controller;

  List<LatLng> get locations => widget.locations.toMapParams();
  List<LatLng> get polyline => widget.polyline.toMapParams();
  LatLngBounds get _bounds => polyline.getBounds();

  @override
  void initState() {
    super.initState();
    _controller = MapController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _controller,
            options: MapOptions(
              initialCenter: _bounds.center,
              initialCameraFit: CameraFit.bounds(bounds: _bounds),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.campguru',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.fitCamera(
            CameraFit.bounds(bounds: _bounds),
          );
        },
        child: Icon(MdiIcons.mapMarkerRadius),
      ),
    );
  }
}
