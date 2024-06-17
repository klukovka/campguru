import 'dart:typed_data';

import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_review_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class NewReviewDto {
  final String text;
  final int rating;
  final List<Uint8List>? photos;

  NewReviewDto({
    required this.text,
    required this.rating,
    required this.photos,
  });

  factory NewReviewDto.fromDomain(NewReview newReview) => NewReviewDto(
        photos: newReview.photos,
        text: newReview.text,
        rating: newReview.rating,
      );

  Map<String, dynamic> toJson() => _$NewReviewDtoToJson(this);
}
