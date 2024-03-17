import 'dart:developer';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/lat_lng_extension.dart';

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
  late GoogleMapController _controller;

  List<LatLng> get locations => widget.locations.toGoogleParams();
  List<LatLng> get polyline => widget.polyline.toGoogleParams();

  List<LatLng>? border;

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
              target: locations.first,
            ),
            polylines: {
              Polyline(
                polylineId: PolylineId(widget.locations),
                color: Theme.of(context).colorScheme.primary,
                points: polyline,
                width: 4,
              ),
              if (border != null)
                Polyline(
                  polylineId: const PolylineId('widget.locations'),
                  color: Colors.black,
                  points: border!,
                  width: 4,
                ),
            },
            markers: locations.map((latLng) {
              return Marker(
                markerId: MarkerId(latLng.toString()),
                position: latLng,
                icon: BitmapDescriptor.defaultMarkerWithHue(
                  math.Random().nextInt(360).toDouble(),
                ),
              );
            }).toSet(),
            onMapCreated: (GoogleMapController controller) async {
              _controller = controller;
              await _controller.moveCamera(
                  CameraUpdate.newLatLngBounds(polyline.getBounds(), 0));
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ArrowCircleButton.back(
                onPressed: context.appRouter.pop,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: () async {
            // final visibleRegion = await _controller.getVisibleRegion();
            // log(visibleRegion.toString());
            // _controller.moveCamera(CameraUpdate.newLatLngZoom(
            //   locations.first,
            //   100,
            // ));
            // final width =
            //     visibleRegion.northeast.latitude - visibleRegion.southwest.latitude;
            // final height = visibleRegion.northeast.longitude -
            //     visibleRegion.southwest.longitude;

            // log('width $width; height $height');

            final visibleRegion = await _controller.getVisibleRegion();
            log(visibleRegion.toString());

            setState(() {
              border = [
                polyline.northeast,
                polyline.southeast,
                polyline.southwest,
                polyline.northwest,
                polyline.northeast,
              ];
            });

            _controller.moveCamera(
              CameraUpdate.newLatLngZoom(polyline.northwest, 25),
            );
          }),
          FloatingActionButton(
            onPressed: () {
              _controller.moveCamera(
                  CameraUpdate.newLatLngBounds(polyline.getBounds(), 0));
            },
            child: const Icon(Icons.back_hand),
          ),
        ],
      ),
    );
  }
}
