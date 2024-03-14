import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/controllers.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/views/locations/location_tile.dart';

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
                        search: (value) => controller.search(
                          state.filter,
                          value,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    FilterButton(
                      isNotEmpty: state.filter.isNotEmpty,
                      onPressed: () {},
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
                          itemBuilder: (context, index) => LocationTile(
                            location: state.locations[index],
                          ),
                          itemCount: state.locations.length,
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
