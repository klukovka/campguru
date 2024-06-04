import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/controllers.dart';
import 'package:presentation/src/pages/trips/views/trip_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class TripsTab extends StatelessWidget implements AutoRouteWrapper {
  const TripsTab({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<TripsTabCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<TripsTabController>();
    return BlocBuilder<TripsTabCubit, TripsTabState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        isLoading: state.isLoading,
                        hintText: context.strings.searchTrips,
                        search: (value) => controller.search(
                          state.filter,
                          value,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    FilterButton(
                      isNotEmpty: state.filter.isNotEmpty,
                      onPressed: () => context.appRouter.pushTripsFiltersPage(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: state.isFirstLoading
                    ? const SkeletonListView()
                    : LoadMoreScrollListener(
                        loadMore: () => controller.uploadNextPage(state.filter),
                        child: ListView.builder(
                          itemBuilder: (context, index) => TripTile(
                            trip: state.trips[index],
                          ),
                          itemCount: state.trips.length,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
