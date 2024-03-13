import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/pages/location_details_page/views/location_photos_carousel.dart';
import 'package:presentation/src/views/locations/location_favorite_button/location_favorite_button.dart';

class LocationDetailsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Location location;
  final double safeTopPadding;
  @override
  final double maxExtent;

  LocationDetailsHeaderDelegate({
    required this.location,
    required this.maxExtent,
    required this.safeTopPadding,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return OverflowBox(
      maxHeight: maxExtent,
      minHeight: maxExtent,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          LocationPhotosCarousel(location: location),
          Positioned(
            top: safeTopPadding,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowButton.back(onPressed: context.appRouter.pop),
                LocationFavoriteButton(location: location),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get minExtent => 132 + safeTopPadding;

  @override
  bool shouldRebuild(covariant LocationDetailsHeaderDelegate oldDelegate) =>
      oldDelegate.location != location ||
      oldDelegate.maxExtent != maxExtent ||
      oldDelegate.safeTopPadding != safeTopPadding;
}
