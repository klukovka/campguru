import 'package:data/src/core/dto.dart';
import 'package:data/src/data_source/hive_type_id.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lat_lng_dto.g.dart';

@HiveType(typeId: HiveTypeId.latLng)
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LatLngDto extends Dto<LatLng> {
  @HiveField(0)
  @JsonKey(name: 'lat')
  final double latitude;
  @HiveField(1)
  @JsonKey(name: 'long')
  final double longitude;

  LatLngDto({
    required this.latitude,
    required this.longitude,
  });

  factory LatLngDto.fromDomain(LatLng latLng) => LatLngDto(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );

  factory LatLngDto.fromJson(Map<String, dynamic> json) =>
      _$LatLngDtoFromJson(json);

  @override
  LatLng toDomain() => LatLng(latitude, longitude);
}
