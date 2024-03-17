import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/lat_lng_extension.dart';

@RoutePage()
class RouteMapPage extends StatefulWidget {
  final String coordinates;

  const RouteMapPage({
    super.key,
    @PathParam() required this.coordinates,
  });

  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<LatLng> get coordinates => widget.coordinates.toGoogleParams();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            initialCameraPosition: CameraPosition(
              zoom: 12,
              target: coordinates.first,
            ),
            polylines: {
              Polyline(
                polylineId: PolylineId(widget.coordinates),
                color: Theme.of(context).colorScheme.primary,
                points: coordinates,
              ),
            },
            markers: coordinates.map((latLng) {
              return Marker(
                markerId: MarkerId(latLng.toString()),
                position: latLng,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  Random().nextInt(360).toDouble(),
                ),
              );
            }).toSet(),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
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
    );
  }
}
