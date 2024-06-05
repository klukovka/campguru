import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/pages/routes/views/route_favorite_button/route_favorite_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class RouteTile extends StatelessWidget {
  final domain.Route route;
  final VoidCallback? onPressed;
  final Widget? buttonBelow;

  const RouteTile({
    super.key,
    required this.route,
    this.onPressed,
    this.buttonBelow,
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
          Text(
            '${route.distance.toStringAsFixed(2)} ${context.strings.km} '
            '(${route.duration.toStringAsFixed(2)} ${context.strings.h})',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(context.strings.amountReviews(route.reviewsAmount)),
        ],
      ),
      favoriteButton: buttonBelow ?? RouteFavoriteButton(route: route),
      onPressed:
          onPressed ?? () => context.appRouter.pushRouteDetailsPage(route.id),
    );
  }
}
