import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';

class RouteFavoriteButton extends StatelessWidget {
  final domain.Route route;

  const RouteFavoriteButton({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return FavoriteButton(
      isFavorite: route.isFavorite,
      onPressed: () {
        final controller = context.locator<RouteFavoriteButtonController>();
        if (route.isFavorite) {
          controller.removeFromFavorites(route.id);
        } else {
          controller.addToFavorites(route.id);
        }
      },
    );
  }
}
