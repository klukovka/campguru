import 'package:data/src/core/dto.dart';
import 'package:data/src/models/routes/route_dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routes_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class RoutesDto extends Dto<Chunk<Route>> {
  final int fullCount;
  final List<RouteDto>? values;

  RoutesDto({required this.fullCount, required this.values});

  factory RoutesDto.fromJson(Map<String, dynamic> json) =>
      _$RoutesDtoFromJson(json);

  @override
  Chunk<Route> toDomain() => Chunk(
        fullCount: fullCount,
        values: (values ?? []).map((e) => e.toDomain()).toList(),
      );
}
