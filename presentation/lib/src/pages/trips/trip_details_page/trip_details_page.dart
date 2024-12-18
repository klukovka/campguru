import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/complete_trip_bottom_bar.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/loading_trip_details_page.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/trip_details_sliver_app_bar.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/users_list.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class TripDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final int tripId;

  const TripDetailsPage({
    super.key,
    @PathParam('id') required this.tripId,
  });

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<TripDetailsPageCubit>(),
      child: this,
    );
  }
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<TripDetailsPageController>().getDetails(widget.tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripDetailsPageCubit, TripDetailsPageState>(
      builder: (context, state) {
        if (state.isLoading) {
          return LoadingTripDetailsPage(trip: state.trip);
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              TripDetailsSliverAppBar(
                trip: state.trip,
                onStretch: () async =>
                    context.appRouter.pushRouteMap(state.route.id),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    '${state.route.distance.getDistance(context)} '
                    '(${state.route.duration.getDuration(context)})',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    context.strings.tripDate(state.trip.date),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: ArrowButton.large(
                    onPressed: () => context.appRouter.pushRouteLocationsPage(
                      state.route.id,
                    ),
                    child: Text(
                      context.strings
                          .locationsAmount(state.route.locationsAmount ?? 0),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    context.strings.usersAmount(state.trip.usersAmount),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              UsersList.sliver(users: state.trip.users ?? []),
            ],
          ),
          bottomNavigationBar: state.trip.completed
              ? null
              : CompleteTripBottomBar(
                  onPressed: () {
                    context.locator<TripDetailsPageController>().complete(
                          widget.tripId,
                        );
                  },
                  isLoading: state.isCompleteLoading,
                ),
        );
      },
    );
  }
}
