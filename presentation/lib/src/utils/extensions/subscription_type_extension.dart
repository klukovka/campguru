import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

extension SubscriptionTypeExtension on SubscriptionType {
  String getLabel(BuildContext context) => switch (this) {
        SubscriptionType.monthly => context.strings.monthly,
        SubscriptionType.yearly => context.strings.yearly,
      };
}
