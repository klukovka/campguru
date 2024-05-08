import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/locations/views/location_tile.dart';

class LocationsList extends StatelessWidget {
  final List<Location> locations;

  const LocationsList({
    super.key,
    required this.locations,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => LocationTile(
        location: locations[index],
      ),
      itemCount: locations.length,
    );
  }
}
