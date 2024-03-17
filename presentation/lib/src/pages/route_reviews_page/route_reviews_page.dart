import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/views/reviews/loading_reviews_list.dart';
import 'package:presentation/src/views/reviews/reviews_list.dart';

@RoutePage()
class RouteReviewsPage extends StatefulWidget implements AutoRouteWrapper {
  final int routeId;

  const RouteReviewsPage({
    super.key,
    @PathParam('id') required this.routeId,
  });

  @override
  State<RouteReviewsPage> createState() => _RouteReviewsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RouteReviewsPageCubit>(),
      child: this,
    );
  }
}

class _RouteReviewsPageState extends State<RouteReviewsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<RouteReviewsPageController>().initalLoading(
            widget.routeId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<RouteReviewsPageController>();

    return BlocBuilder<RouteReviewsPageCubit, RouteReviewsPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            onPop: context.appRouter.pop,
          ),
          body: state.isFirstLoading
              ? const LoadingReviewsList()
              : LoadMoreScrollListener(
                  loadMore: () => controller.uploadNextPage(
                    widget.routeId,
                    state.filter,
                  ),
                  child: ReviewsList(reviews: state.reviews),
                ),
        );
      },
    );
  }
}
