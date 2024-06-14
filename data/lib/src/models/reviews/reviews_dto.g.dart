// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsDto _$ReviewsDtoFromJson(Map<String, dynamic> json) => ReviewsDto(
      fullCount: (json['full_count'] as num).toInt(),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => ReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
