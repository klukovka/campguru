import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/views/routes/route_favorite_button/route_favorite_button.dart';

class RouteTile extends StatelessWidget {
  final domain.Route route;

  const RouteTile({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      imageUrl: route.mapUrl,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            route.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          IconTheme(
            data: const IconThemeData(size: 20),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyLarge!,
              child: RatingView(rate: route.mark),
            ),
          ),
          const SizedBox(height: 8),
          //TODO: Add correct formatting and localizations
          Text(
            '${route.distance.toStringAsFixed(2)} km (${route.duration.toStringAsFixed(2)} hours)',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          //TODO: Add localization
          Text('${route.reviewsAmount} Reviews'),
        ],
      ),
      favoriteButton: RouteFavoriteButton(route: route),
      onPressed: () => context.appRouter.pushRouteDetailsPage(route.id),
    );
  }
}
