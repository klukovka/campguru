// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => ReviewDto(
      id: (json['id'] as num).toInt(),
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      mark: (json['mark'] as num).toDouble(),
      review: json['review'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
