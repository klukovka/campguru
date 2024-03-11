import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LocationDetailsPage extends StatefulWidget {
  final int locationId;

  const LocationDetailsPage({
    super.key,
    @PathParam('id') required this.locationId,
  });

  @override
  State<LocationDetailsPage> createState() => _LocationDetailsPageState();
}

class _LocationDetailsPageState extends State<LocationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
