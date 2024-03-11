import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/controllers.dart';
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
        return LoadMoreScrollListener(
          loadMore: () => context
              .locator<LocationsTabController>()
              .uploadNextPage(state.filter),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final location = state.locations[index];
              return ItemCard(
                imageUrl: location.images.first,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    IconTheme(
                      data: const IconThemeData(size: 20),
                      child: DefaultTextStyle(
                        style: Theme.of(context).textTheme.bodyLarge!,
                        child: RatingView(rate: location.mark),
                      ),
                    ),
                    const SizedBox(height: 8),
                    //TODO: Add localization
                    Text('${location.reviewsAmount} Reviews'),
                  ],
                ),
                favoriteButton: Container(
                  width: 20,
                  height: 20,
                  color: Colors.amber,
                ),
              );
            },
            itemCount: state.locations.length,
          ),
        );
      },
    );
  }
}
