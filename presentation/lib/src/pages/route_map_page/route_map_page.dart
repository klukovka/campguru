import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';

@RoutePage()
class RouteMapPage extends StatefulWidget {
  const RouteMapPage({super.key});

  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            initialCameraPosition: const CameraPosition(
              zoom: 8,
              target: LatLng(23, 23),
            ),
            markers: const {},
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
