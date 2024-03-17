import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StyledChips extends StatelessWidget {
  final List<String> labels;

  const StyledChips({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: labels
          .map((label) => Skeleton.unite(child: Chip(label: Text(label))))
          .toList(),
    );
  }
}
