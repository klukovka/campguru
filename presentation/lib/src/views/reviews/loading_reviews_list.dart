import 'package:flutter/material.dart';
import 'package:presentation/src/utils/skeletonizer/entities_skeletonizer_utils.dart';
import 'package:presentation/src/views/reviews/reviews_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingReviewsList extends StatelessWidget {
  final bool _isSliver;

  const LoadingReviewsList({super.key}) : _isSliver = false;
  const LoadingReviewsList.sliver({super.key}) : _isSliver = true;

  @override
  Widget build(BuildContext context) {
    final reviews = List.generate(
      5,
      (index) => EntitiesSkeletonizerUtils.review,
    );

    if (_isSliver) {
      return Skeletonizer.sliver(
        child: ReviewsList.sliver(reviews: reviews),
      );
    }
    return Skeletonizer(
      child: ReviewsList(reviews: reviews),
    );
  }
}
