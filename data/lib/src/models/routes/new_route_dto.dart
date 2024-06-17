import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_route_dto.g.dart';

@JsonSerializable(createFactory: false, fieldRename: FieldRename.snake)
class NewRouteDto {
  final List<int> locations;
  final String name;
  final String description;
  final bool isPrivate;
  final List<int> labels;

  NewRouteDto({
    required this.locations,
    required this.name,
    required this.description,
    required this.isPrivate,
    required this.labels,
  });

  factory NewRouteDto.fromDomain(NewRoute newRoute) => NewRouteDto(
        locations: newRoute.locations,
        name: newRoute.name,
        description: newRoute.description,
        isPrivate: newRoute.isPrivate,
        labels: newRoute.labels,
      );

  Map<String, dynamic> toJson() => _$NewRouteDtoToJson(this);
}
