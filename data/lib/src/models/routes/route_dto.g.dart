// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteDto _$RouteDtoFromJson(Map<String, dynamic> json) => RouteDto(
      id: (json['id'] as num).toInt(),
      isFavorite: json['is_favorite'] as bool,
      name: json['name'] as String,
      mark: (json['mark'] as num).toDouble(),
      mapUrl: json['map_url'] as String,
      distance: (json['distance'] as num).toDouble(),
      duration: json['duration'] as String,
      reviewsAmount: (json['reviews_amount'] as num).toInt(),
      isMine: json['is_mine'] as bool,
      locationsAmount: (json['locations_amount'] as num?)?.toInt(),
      description: json['description'] as String?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => LatLngDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      polyline: (json['polyline'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
