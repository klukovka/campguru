import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
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
      context.locator<TripDetailsPageController>()(widget.tripId);
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
                onStretch: () => context.appRouter.pushRouteMap(
                  polyline: state.route.polyline ?? [],
                  locations: state.route.locations ?? [],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    onPressed: () => context.appRouter.pushRouteLocationsPage(
                      state.route.id,
                    ),
                    //TODO: Add localization
                    child: Text('Locations (${state.route.locationsAmount})'),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    //TODO: Add localization

                    'Users (${state.trip.usersAmount})',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              UsersList.sliver(users: state.trip.users ?? []),
            ],
          ),
        );
      },
    );
  }
}
