// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      id: (json['id'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
      mark: (json['mark'] as num).toDouble(),
      reviewsAmount: (json['reviews_amount'] as num).toInt(),
      isFavorite: json['is_favorite'] as bool,
      long: (json['long'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );
