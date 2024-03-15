import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/pages/route_details_page/views/route_details_header_delegate.dart';
import 'package:presentation/src/views/reviews/reviews_list.dart';

@RoutePage()
class RouteDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final int routeId;

  const RouteDetailsPage({
    super.key,
    @PathParam('id') required this.routeId,
  });

  @override
  State<RouteDetailsPage> createState() => _RouteDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RouteDetailsPageCubit>(),
      child: this,
    );
  }
}

class _RouteDetailsPageState extends State<RouteDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<RouteDetailsPageController>()(widget.routeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteDetailsPageCubit, RouteDetailsPageState>(
      builder: (context, state) {
        // if (state.isLoading) {
        //   return LoadingRouteDetailsPage(route: state.route);
        // }

        final description = state.route.description ?? '';
        final labels = state.route.labels ?? [];
        final reviews = state.route.reviews ?? [];
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: RouteDetailsHeaderDelegate(
                  route: state.route,
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
                  child: Text(
                    //TODO: Add correct formatting and localizations
                    '${state.route.distance.toStringAsFixed(2)} km (${state.route.duration.toStringAsFixed(2)} hours)',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: ArrowButton.large(
                    onPressed: () {
                      //TODO: Push locations
                    },
                    //TODO: Add localization
                    child: Text('Locations (${state.route.locationsAmount})'),
                  ),
                ),
              ),
              if (labels.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: labels
                          .map((label) => Chip(label: Text(label)))
                          .toList(),
                    ),
                  ),
                ),
              if (state.route.reviewsAmount != 0)
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      //TODO: Add localization
                      children: [
                        Expanded(
                          child: Text(
                            'Reviews (${state.route.reviewsAmount})',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        ArrowButton.small(
                          onPressed: () {
                            //TODO: push reviews
                          },
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
