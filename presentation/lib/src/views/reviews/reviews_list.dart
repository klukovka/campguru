import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/views/reviews/review_tile.dart';

class ReviewsList extends StatelessWidget {
  final List<Review> reviews;
  final bool _isSliver;

  const ReviewsList({super.key, required this.reviews}) : _isSliver = false;
  const ReviewsList.sliver({super.key, required this.reviews})
      : _isSliver = true;

  @override
  Widget build(BuildContext context) {
    if (_isSliver) {
      return SliverList.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: _separatorBuilder,
        itemCount: reviews.length,
      );
    }

    return ListView.separated(
      itemBuilder: _itemBuilder,
      separatorBuilder: _separatorBuilder,
      itemCount: reviews.length,
    );
  }

  Widget _itemBuilder(context, index) => Padding(
        padding: const EdgeInsets.all(16),
        child: ReviewTile(review: reviews[index]),
      );

  Widget _separatorBuilder(context, index) => const Divider();
}
