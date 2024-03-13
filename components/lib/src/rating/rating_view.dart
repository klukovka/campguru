import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RatingView extends StatelessWidget {
  static const _starCount = 5;
  final double rate;
  final MainAxisAlignment mainAxisAlignment;

  const RatingView({
    super.key,
    required this.rate,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Skeleton.unite(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(_starCount, (index) {
            return Icon(
              index < rate ? Icons.star : Icons.star_border_outlined,
              color: Theme.of(context).colorScheme.primary,
            );
          }),
          const SizedBox(width: 4),
          Text('(${rate.toStringAsFixed(2)})'),
        ],
      ),
    );
  }
}
