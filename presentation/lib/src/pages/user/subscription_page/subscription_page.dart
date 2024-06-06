import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

@RoutePage()
class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.subscription),
      ),
    );
  }
}
