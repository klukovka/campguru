import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoriteRoutesTab extends StatelessWidget {
  const FavoriteRoutesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorite'),
    );
  }
}
