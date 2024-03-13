import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/pages/location_details_page/views/location_details_header_delegate.dart';
import 'package:presentation/src/views/reviews/loading_reviews_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingLocationDetailsPage extends StatelessWidget {
  final Location location;
  const LoadingLocationDetailsPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              Skeletonizer.sliver(
                child: SliverPersistentHeader(
                  pinned: true,
                  delegate: LocationDetailsHeaderDelegate(
                    location: location,
                    maxExtent: MediaQuery.sizeOf(context).width,
                    safeTopPadding: MediaQuery.paddingOf(context).top,
                  ),
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
              const Skeletonizer.sliver(
                child: SliverPadding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: ArrowButton.large(
                      //TODO: Add localization
                      child: Text('View on Map'),
                    ),
                  ),
                ),
              ),
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: SkeletonUtils.shortTextList
                          .map((label) =>
                              Skeleton.unite(child: Chip(label: Text(label))))
                          .toList(),
                    ),
                  ),
                ),
              ),
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      //TODO: Add localization
                      children: [
                        Expanded(
                          child: Text(
                            'Reviews',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const ArrowButton.small(
                          //TODO: Add localization
                          child: Text('more'),
                        )
                      ],
                    ),
                  ),
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
