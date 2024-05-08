import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/controllers.dart';
import 'package:presentation/src/pages/locations/views/locations_list.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class LocationsTab extends StatelessWidget implements AutoRouteWrapper {
  const LocationsTab({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<LocationsTabCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<LocationsTabController>();
    return BlocBuilder<LocationsTabCubit, LocationsTabState>(
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
                        //TODO: Localizations
                        hintText: 'Search Locations',
                        isLoading: state.isLoading,
                        search: (value) => controller.search(
                          state.filter,
                          value,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    FilterButton(
                      isNotEmpty: state.filter.isNotEmpty,
                      onPressed: () =>
                          context.appRouter.pushLocationsFiltersPage(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: state.isFirstLoading
                    ? const SkeletonListView()
                    : LoadMoreScrollListener(
                        loadMore: () => controller.uploadNextPage(state.filter),
                        child: LocationsList(locations: state.locations),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
