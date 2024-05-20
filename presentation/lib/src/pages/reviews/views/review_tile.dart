import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/date_formatter_extension.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleIconPreview.user(
          imageUrl: review.user.photo,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.user.fullname,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconTheme(
                data: const IconThemeData(size: 16),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodySmall!,
                  child: RatingView(rate: review.mark),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(review.review),
              ),
              if (review.photos.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ImagesPreview(images: review.photos),
                ),
              Text(
                review.createdAt.dayAbbreviatedMonthYear,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
