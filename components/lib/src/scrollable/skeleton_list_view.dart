import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonListView extends StatelessWidget {
  const SkeletonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const Skeleton.leaf(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(height: 152),
          ),
        ),
      ),
    );
  }
}
