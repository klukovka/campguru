import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/reviews/views/more_reviews_button.dart';
import 'package:presentation/src/pages/reviews/views/reviews_list.dart';
import 'package:presentation/src/pages/routes/route_details_page/views/loading_route_details_page.dart';
import 'package:presentation/src/pages/routes/route_details_page/views/route_details_sliver_app_bar.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

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
        if (state.isLoading) {
          return LoadingRouteDetailsPage(route: state.route);
        }

        final description = state.route.description ?? '';
        final labels = state.route.labels ?? [];
        final reviews = state.route.reviews ?? [];
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              RouteDetailsSliverAppBar(
                route: state.route,
                onStretch: () => context.appRouter.pushRouteMap(widget.routeId),
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
                    '${state.route.distance.toStringAsFixed(2)} ${context.strings.km} '
                    '(${state.route.duration.toStringAsFixed(2)} ${context.strings.h})',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: ArrowButton.large(
                    onPressed: () => context.appRouter.pushRouteLocationsPage(
                      widget.routeId,
                    ),
                    child: Text(
                      context.strings
                          .locationsAmount(state.route.locationsAmount ?? 0),
                    ),
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
              if (state.route.reviewsAmount != 0)
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: MoreReviewsButton(
                      reviewsAmount: state.route.reviewsAmount,
                      onMorePressed: () =>
                          context.appRouter.pushRouteReviewsPage(
                        widget.routeId,
                      ),
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
