import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonReplacement extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  const SkeletonReplacement({
    super.key,
    required this.child,
    this.borderRadius,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = Skeletonizer.maybeOf(context)?.enabled ?? false;
    if (isLoading) {
      return Skeleton.replace(
        height: height,
        width: width,
        replacement: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: const Card(elevation: 0),
      );
    }

    return child;
  }
}
