// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsDto _$LocationsDtoFromJson(Map<String, dynamic> json) => LocationsDto(
      fullCount: (json['full_count'] as num).toInt(),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
