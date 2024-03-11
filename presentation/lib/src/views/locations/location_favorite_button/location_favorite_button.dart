import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';

class LocationFavoriteButton extends StatelessWidget {
  final Location location;

  const LocationFavoriteButton({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return FavoriteButton(
      isFavorite: location.isFavorite,
      onPressed: () {
        final controller = context.locator<LocationFavoriteButtonController>();
        if (location.isFavorite) {
          controller.removeFromFavorites(location.id);
        } else {
          controller.addToFavorites(location.id);
        }
      },
    );
  }
}
