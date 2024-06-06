import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class LocationMapPage extends StatefulWidget {
  final double lng;
  final double lat;

  const LocationMapPage({
    super.key,
    @QueryParam() this.lng = 0,
    @QueryParam() this.lat = 0,
  });

  @override
  State<LocationMapPage> createState() => LocationMapPageState();
}

class LocationMapPageState extends State<LocationMapPage> {
  late final MapController _controller;

  LatLng get _initialPosition => LatLng(widget.lat, widget.lng);

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
              initialCenter: _initialPosition,
              initialZoom: 8,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.campguru',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _initialPosition,
                    rotate: false,
                    child: Icon(
                      MdiIcons.mapMarker,
                      size: 32,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.move(_initialPosition, 8);
        },
        child: Icon(MdiIcons.mapMarkerRadius),
      ),
    );
  }
}
