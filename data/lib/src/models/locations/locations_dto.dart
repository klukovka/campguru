import 'package:data/src/core/dto.dart';
import 'package:data/src/models/locations/location_dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'locations_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LocationsDto extends Dto<Chunk<Location>> {
  final int fullCount;
  final List<LocationDto>? values;

  LocationsDto({required this.fullCount, required this.values});

  factory LocationsDto.fromJson(Map<String, dynamic> json) =>
      _$LocationsDtoFromJson(json);

  @override
  Chunk<Location> toDomain() => Chunk(
        fullCount: fullCount,
        values: (values ?? []).map((e) => e.toDomain()).toList(),
      );
}
