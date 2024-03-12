import 'package:components/components.dart';
import 'package:flutter/material.dart';

class RatingNameInfoBar extends StatelessWidget {
  final String name;
  final double mark;

  const RatingNameInfoBar({
    super.key,
    required this.name,
    required this.mark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          IconTheme(
            data: const IconThemeData(size: 24),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge!,
              child: RatingView(
                rate: mark,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
