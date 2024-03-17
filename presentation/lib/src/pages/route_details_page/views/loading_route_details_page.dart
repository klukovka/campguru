import 'package:components/components.dart';
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/pages/route_details_page/views/route_details_sliver_app_bar.dart';
import 'package:presentation/src/views/reviews/loading_reviews_list.dart';
import 'package:presentation/src/views/reviews/more_reviews_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingRouteDetailsPage extends StatelessWidget {
  final domain.Route route;
  const LoadingRouteDetailsPage({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              Skeletonizer.sliver(
                child: RouteDetailsSliverAppBar(
                  route: route,
                ),
              ),
              const Skeletonizer.sliver(
                child: SliverPadding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(SkeletonUtils.longText),
                  ),
                ),
              ),
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      //TODO: Add correct formatting and localizations
                      '${route.distance.toStringAsFixed(2)} km (${route.duration.toStringAsFixed(2)} hours)',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: ArrowButton.large(
                      //TODO: Add localization
                      child: Text('Locations (${route.locationsAmount})'),
                    ),
                  ),
                ),
              ),
              const Skeletonizer.sliver(
                child: SliverPadding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: StyledChips(labels: SkeletonUtils.shortTextList),
                  ),
                ),
              ),
              const Skeletonizer.sliver(
                child: SliverPadding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(child: MoreReviewsButton()),
                ),
              ),
              const LoadingReviewsList.sliver(),
            ],
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top,
            left: 16,
            child: ArrowCircleButton.back(
              onPressed: context.appRouter.pop,
            ),
          ),
        ],
      ),
    );
  }
}
