import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  LatLng get _initialPosition => LatLng(widget.lat, widget.lng);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.future,
      builder: (context, snapshot) {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                compassEnabled: false,
                initialCameraPosition: CameraPosition(
                  zoom: 12,
                  target: _initialPosition,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('location'),
                    anchor: const Offset(0.5, 0.5),
                    position: _initialPosition,
                  )
                },
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: snapshot.hasData
              ? FloatingActionButton(
                  onPressed: () async {
                    final controller = snapshot.data!;
                    controller
                        .moveCamera(CameraUpdate.newLatLng(_initialPosition));
                  },
                  child: Icon(MdiIcons.mapMarkerRadius),
                )
              : null,
        );
      },
    );
  }
}
