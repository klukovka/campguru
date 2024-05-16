import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/pages/routes/create_route_page/views/location_row.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class LocationSelectorView extends StatelessWidget {
  final List<Location> locations;
  final ValueChanged<List<Location>> onChanged;
  final ValueChanged<Location> onRemoved;

  const LocationSelectorView({
    super.key,
    required this.locations,
    required this.onChanged,
    required this.onRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowButton.small(
          child: const Text('Select Locations'),
          onPressed: () async {
            final selectedLocations =
                await context.appRouter.pushSelectableLocationsPage(
                      locations,
                    ) ??
                    [];

            onChanged(selectedLocations);
          },
        ),
        ...locations.map((location) {
          return LocationRow(
            location: location,
            onPressed: () => onRemoved(location),
          );
        }).expand((element) => [const SizedBox(height: 4), element]),
      ],
    );
  }
}
