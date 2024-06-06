import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/utils/extensions/subscription_type_extension.dart';

class SubscriptionTile extends StatelessWidget {
  final Subscription subscription;

  const SubscriptionTile({
    super.key,
    required this.subscription,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: Add localization
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: subscription.type.getLabel(context),
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              TextSpan(
                text: ' (${subscription.price.toInt()}) ${context.strings.uah}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        if (subscription.discount != null)
          Text(
            '${context.strings.discount}: ${subscription.discount?.toInt()}%',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
      ],
    );
  }
}
