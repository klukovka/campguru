import 'package:components/components.dart';
import 'package:flutter/material.dart';

class RouteCacheProgressView extends StatelessWidget {
  const RouteCacheProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Get it from cubit
    const progress = 50.0;
    return const CacheProgressView(progress: progress);
  }
}
