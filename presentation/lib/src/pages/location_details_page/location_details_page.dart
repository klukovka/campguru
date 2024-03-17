import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/pages/location_details_page/views/loading_location_details_page.dart';
import 'package:presentation/src/pages/location_details_page/views/location_details_header_delegate.dart';
import 'package:presentation/src/views/reviews/reviews_list.dart';

@RoutePage()
class LocationDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final int locationId;

  const LocationDetailsPage({
    super.key,
    @PathParam('id') required this.locationId,
  });

  @override
  State<LocationDetailsPage> createState() => _LocationDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<LocationDetailsPageCubit>(),
      child: this,
    );
  }
}

class _LocationDetailsPageState extends State<LocationDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<LocationDetailsPageController>()(widget.locationId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationDetailsPageCubit, LocationDetailsPageState>(
      builder: (context, state) {
        if (state.isLoading) {
          return LoadingLocationDetailsPage(location: state.location);
        }

        final description = state.location.description ?? '';
        final labels = state.location.labels ?? [];
        final reviews = state.location.reviews ?? [];
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: LocationDetailsHeaderDelegate(
                  location: state.location,
                  maxExtent: MediaQuery.sizeOf(context).width,
                  safeTopPadding: MediaQuery.paddingOf(context).top,
                ),
              ),
              if (description.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(description),
                  ),
                ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: ArrowButton.large(
                    onPressed: () => context.appRouter.pushLocationMap(
                      lat: state.location.lat,
                      lng: state.location.lng,
                    ),
                    //TODO: Add localization
                    child: const Text('View on Map'),
                  ),
                ),
              ),
              if (labels.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: StyledChips(labels: labels),
                  ),
                ),
              if (state.location.reviewsAmount != 0)
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      //TODO: Add localization
                      children: [
                        Expanded(
                          child: Text(
                            'Reviews (${state.location.reviewsAmount})',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        ArrowButton.small(
                          onPressed: () =>
                              context.appRouter.pushLocationReviewsPage(
                            widget.locationId,
                          ),
                          //TODO: Add localization
                          child: const Text('more'),
                        )
                      ],
                    ),
                  ),
                ),
              if (reviews.isNotEmpty) ReviewsList.sliver(reviews: reviews),
            ],
          ),
        );
      },
    );
  }
}
