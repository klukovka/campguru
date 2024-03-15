import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/views/routes/route_favorite_button/route_favorite_button.dart';
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
          Image.network(
            route.mapUrl,
            height: MediaQuery.sizeOf(context).width,
            width: MediaQuery.sizeOf(context).width,
          ),
          Positioned(
            top: safeTopPadding,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton.ignore(
                  child: ArrowCircleButton.back(
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
}
