import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/date_formatter_extension.dart';

class TripTile extends StatelessWidget {
  final Trip trip;

  const TripTile({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      imageUrl: trip.route.mapUrl,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trip.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            trip.date.dayAbbreviatedMonthYear,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(trip.completed ? Icons.check : Icons.close),
              const SizedBox(width: 8),
              //TODO: Add localizations
              Text(trip.completed ? 'Completed' : 'Uncompleted'),
            ],
          ),
        ],
      ),
      onPressed: () {
        //TODO: Open details
      },
    );
  }
}
