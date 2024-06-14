// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutesDto _$RoutesDtoFromJson(Map<String, dynamic> json) => RoutesDto(
      fullCount: (json['full_count'] as num).toInt(),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => RouteDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
