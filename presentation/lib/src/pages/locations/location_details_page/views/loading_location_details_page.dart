import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/pages/locations/location_details_page/views/location_details_header_delegate.dart';
import 'package:presentation/src/pages/reviews/views/loading_reviews_list.dart';
import 'package:presentation/src/pages/reviews/views/more_reviews_button.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
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
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: ArrowButton.large(
                      child: Text(context.strings.viewOnMap),
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
