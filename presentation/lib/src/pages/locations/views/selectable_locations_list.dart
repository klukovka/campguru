import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/pages/locations/views/location_tile.dart';

class SelectableLocationsList extends StatelessWidget {
  final List<Location> locations;
  final List<Location> selectedLocations;
  final ValueChanged<Location> onRemoved;
  final ValueChanged<Location> onAdded;

  const SelectableLocationsList({
    super.key,
    required this.locations,
    required this.selectedLocations,
    required this.onRemoved,
    required this.onAdded,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final location = locations[index];
        final isSelected = selectedLocations.any(
          (element) => element.id == location.id,
        );
        return LocationTile(
          location: location,
          buttonBelow: CheckButton(
            isChecked: isSelected,
            onPressed: () {
              if (isSelected) {
                onRemoved(location);
              } else {
                onAdded(location);
              }
            },
          ),
        );
      },
      itemCount: locations.length,
    );
  }
}
