import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CachedRoutesTab extends StatelessWidget {
  const CachedRoutesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cached'),
    );
  }
}
