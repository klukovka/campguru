import 'dart:developer';

import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/trip_photos_carousel.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TripDetailsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Trip trip;
  final double safeTopPadding;
  @override
  final double maxExtent;

  TripDetailsHeaderDelegate({
    required this.trip,
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
          TripPhotosCarousel(trip: trip),
          Positioned(
            top: safeTopPadding,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton.ignore(
                  child: IconCircleButton.arrowBack(
                    onPressed: context.appRouter.pop,
                  ),
                ),
                //TODO: Add chat button
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
  bool shouldRebuild(covariant TripDetailsHeaderDelegate oldDelegate) =>
      oldDelegate.trip != trip ||
      oldDelegate.maxExtent != maxExtent ||
      oldDelegate.safeTopPadding != safeTopPadding;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration(
        stretchTriggerOffset: maxExtent / 2,
        onStretchTrigger: () async {
          log('Stretch');
        },
      );

  double get maxShrinkOffset => maxExtent - minExtent;
}
