import 'package:components/components.dart';
import 'package:flutter/material.dart';

class MoreReviewsButton extends StatelessWidget {
  final VoidCallback? onMorePressed;
  final int reviewsAmount;

  const MoreReviewsButton({
    super.key,
    this.onMorePressed,
    this.reviewsAmount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //TODO: Add localization
      children: [
        Expanded(
          child: Text(
            'Reviews ($reviewsAmount)',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        ArrowButton.small(
          onPressed: onMorePressed,
          //TODO: Add localization
          child: const Text('more'),
        )
      ],
    );
  }
}
