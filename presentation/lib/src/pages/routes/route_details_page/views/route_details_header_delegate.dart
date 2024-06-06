import 'dart:developer';

import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/pages/routes/route_details_page/views/route_photos_carousel.dart';
import 'package:presentation/src/pages/routes/views/route_favorite_button/route_favorite_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RouteDetailsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final domain.Route route;
  final double safeTopPadding;
  @override
  final double maxExtent;

  RouteDetailsHeaderDelegate({
    required this.route,
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
          RoutePhotosCarousel(route: route),
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
                Skeleton.ignore(
                  child: RouteFavoriteButton(route: route),
                ),
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
  bool shouldRebuild(covariant RouteDetailsHeaderDelegate oldDelegate) =>
      oldDelegate.route != route ||
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
