import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/routes/views/route_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class TripRouteView extends StatelessWidget {
  final Route? route;

  const TripRouteView({super.key, this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArrowButton.large(
          child: const Text('Select Route'),
          onPressed: () => context.appRouter.pushSelectableRoutePage(route),
        ),
        if (route != null)
          RouteTile(
            route: route!,
            buttonBelow: DeleteCircleButton(
              onPressed: context.locator<CreateTripPageController>().clearRoute,
            ),
          ),
      ],
    );
  }
}
