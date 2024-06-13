import 'dart:convert';

import 'package:data/src/core/dto.dart';
import 'package:data/src/models/users/user_dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ReviewDto extends Dto<Review> {
  final int id;
  final UserDto user;
  final double mark;
  final String review;
  final DateTime createdAt;
  final List<String>? photos;

  ReviewDto({
    required this.id,
    required this.user,
    required this.mark,
    required this.review,
    required this.createdAt,
    this.photos,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);

  @override
  Review toDomain() => Review(
        id: id,
        user: user.toDomain(),
        mark: mark,
        review: review,
        createdAt: createdAt,
        photos: photos?.map(base64.decode).toList() ?? [],
      );
}
