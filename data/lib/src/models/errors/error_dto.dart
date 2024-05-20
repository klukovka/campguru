import 'package:json_annotation/json_annotation.dart';

part 'error_dto.g.dart';

@JsonSerializable(createToJson: false)
class ErrorDto {
  final String? message;

  ErrorDto(this.message);

  factory ErrorDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDtoFromJson(json);
}
