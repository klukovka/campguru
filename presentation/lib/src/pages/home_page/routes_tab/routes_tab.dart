import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RoutesTab extends StatelessWidget {
  const RoutesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Routes'),
    );
  }
}
