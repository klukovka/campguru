import 'package:data/src/core/dto.dart';
import 'package:data/src/models/reviews/review_dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ReviewsDto extends Dto<Chunk<Review>> {
  final int fullCount;
  final List<ReviewDto>? values;

  ReviewsDto({required this.fullCount, required this.values});

  factory ReviewsDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDtoFromJson(json);

  @override
  Chunk<Review> toDomain() => Chunk(
        fullCount: fullCount,
        values: (values ?? []).map((e) => e.toDomain()).toList(),
      );
}
