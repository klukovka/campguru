import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class LocationSelectorView extends StatelessWidget {
  final String? preview;
  final List<Location> locations;
  final ValueChanged<List<Location>> onChanged;
  final ValueChanged<Location> onRemoved;

  const LocationSelectorView({
    super.key,
    this.preview,
    required this.locations,
    required this.onChanged,
    required this.onRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedNetworkImage(
          imageUrl: preview,
          height: 100,
          width: 100,
        ),
        const SizedBox(width: 12),
        //TODO: Add Localizations
        ArrowButton.small(
          child: const Text('Select Locations'),
          onPressed: () {},
        ),
      ],
    );
  }
}
