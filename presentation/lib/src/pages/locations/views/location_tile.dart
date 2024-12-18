import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/pages/locations/views/location_favorite_button/location_favorite_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  final Widget? buttonBelow;

  const LocationTile({
    super.key,
    required this.location,
    this.buttonBelow,
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
          Text(context.strings.amountReviews(location.reviewsAmount)),
        ],
      ),
      favoriteButton: buttonBelow ?? LocationFavoriteButton(location: location),
      onPressed: () => context.appRouter.pushLocationDetailsPage(location.id),
    );
  }
}
