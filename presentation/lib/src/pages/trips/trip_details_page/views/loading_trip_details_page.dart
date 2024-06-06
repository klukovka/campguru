import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/loading_users_list.dart';
import 'package:presentation/src/pages/trips/trip_details_page/views/trip_details_sliver_app_bar.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingTripDetailsPage extends StatelessWidget {
  final Trip trip;
  const LoadingTripDetailsPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              Skeletonizer.sliver(
                child: TripDetailsSliverAppBar(
                  trip: trip,
                ),
              ),
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      '${trip.route.distance.toStringAsFixed(2)} ${context.strings.km} '
                      '(${trip.route.duration.toStringAsFixed(2)} ${context.strings.h})',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: ArrowButton.large(
                      child: Text(
                        context.strings
                            .locationsAmount(trip.route.locationsAmount ?? 0),
                      ),
                    ),
                  ),
                ),
              ),
              Skeletonizer.sliver(
                child: SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      context.strings.usersAmount(trip.usersAmount),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              const LoadingUsersList.sliver(),
            ],
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top,
            left: 16,
            child: IconCircleButton.arrowBack(
              onPressed: context.appRouter.pop,
            ),
          ),
        ],
      ),
    );
  }
}
