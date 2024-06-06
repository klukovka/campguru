import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/reviews/views/loading_reviews_list.dart';
import 'package:presentation/src/pages/reviews/views/reviews_list.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class LocationReviewsPage extends StatefulWidget implements AutoRouteWrapper {
  final int locationId;

  const LocationReviewsPage({
    super.key,
    @PathParam('id') required this.locationId,
  });

  @override
  State<LocationReviewsPage> createState() => _LocationReviewsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<LocationReviewsPageCubit>(),
      child: this,
    );
  }
}

class _LocationReviewsPageState extends State<LocationReviewsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<LocationReviewsPageController>().initalLoading(
            widget.locationId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<LocationReviewsPageController>();

    return BlocBuilder<LocationReviewsPageCubit, LocationReviewsPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            onPop: context.appRouter.pop,
            trailing: IconCircleButton.add(
              onPressed: () => context.appRouter.pushCreateLocationReviewPage(
                widget.locationId,
              ),
            ),
          ),
          body: state.isFirstLoading
              ? const LoadingReviewsList()
              : LoadMoreScrollListener(
                  loadMore: () => controller.uploadNextPage(
                    widget.locationId,
                    state.filter,
                  ),
                  child: ReviewsList(reviews: state.reviews),
                ),
        );
      },
    );
  }
}
