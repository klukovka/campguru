import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/controllers.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/views/location_tile.dart';

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
    return BlocBuilder<LocationsTabCubit, LocationsTabState>(
      builder: (context, state) {
        return LoadMoreScrollListener(
          loadMore: () => context
              .locator<LocationsTabController>()
              .uploadNextPage(state.filter),
          child: ListView.builder(
            itemBuilder: (context, index) => LocationTile(
              location: state.locations[index],
            ),
            itemCount: state.locations.length,
          ),
        );
      },
    );
  }
}
