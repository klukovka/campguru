import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

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
      children: [
        Expanded(
          child: Text(
            context.strings.reviewsAmount(reviewsAmount),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        ArrowButton.small(
          onPressed: onMorePressed,
          child: Text(context.strings.more.toLowerCase()),
        )
      ],
    );
  }
}
