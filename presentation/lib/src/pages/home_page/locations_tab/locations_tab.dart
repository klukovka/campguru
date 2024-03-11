import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';

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
        return ListView.builder(
          itemBuilder: (context, index) => Text(state.locations[index].name),
          itemCount: state.locations.length,
        );
      },
    );
  }
}
