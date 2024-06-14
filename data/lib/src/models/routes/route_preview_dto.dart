import 'package:data/src/core/dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_preview_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class RoutePreviewDto extends Dto<RoutePreview> {
  final String mapUrl;

  RoutePreviewDto({
    required this.mapUrl,
  });

  factory RoutePreviewDto.fromJson(Map<String, dynamic> json) =>
      _$RoutePreviewDtoFromJson(json);

  @override
  RoutePreview toDomain() => RoutePreview(mapUrl: mapUrl);
}
