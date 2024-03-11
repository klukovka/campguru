import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  static const _starCount = 5;
  final double rate;

  const RatingView({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
