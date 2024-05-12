import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class LoadingTripDetailsPage extends StatelessWidget {
  final Trip trip;
  const LoadingTripDetailsPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomScrollView(slivers: []),
          Positioned(
            top: MediaQuery.paddingOf(context).top,
            left: 16,
            child: ArrowCircleButton.back(
              onPressed: context.appRouter.pop,
            ),
          ),
        ],
      ),
    );
  }
}
