import 'package:data/src/core/dto.dart';
import 'package:data/src/data_source/hive_type_id.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'lat_lng_dto.g.dart';

@HiveType(typeId: HiveTypeId.latLng)
class LatLngDto extends Dto<LatLng> {
  @HiveField(0)
  final double latitude;
  @HiveField(1)
  final double longitude;

  LatLngDto({
    required this.latitude,
    required this.longitude,
  });

  factory LatLngDto.fromDomain(LatLng latLng) => LatLngDto(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      );

  @override
  LatLng toDomain() => LatLng(latitude, longitude);
}
