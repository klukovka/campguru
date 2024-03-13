import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/views/locations/location_favorite_button/location_favorite_button.dart';

class LocationTile extends StatelessWidget {
  final Location location;

  const LocationTile({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      imageUrl: location.images.first,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          IconTheme(
            data: const IconThemeData(size: 20),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyLarge!,
              child: RatingView(rate: location.mark),
            ),
          ),
          const SizedBox(height: 8),
          //TODO: Add localization
          Text('${location.reviewsAmount} Reviews'),
        ],
      ),
      favoriteButton: LocationFavoriteButton(location: location),
      onPressed: () => context.appRouter.pushLocationDetailsPage(location.id),
    );
  }
}
