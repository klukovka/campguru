import 'package:data/src/core/dto.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_details_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AuthenticationDetailsDto extends Dto<AuthenticationDetails> {
  final int userId;
  final String accessJwtToken;
  final String? refreshJwtToken;

  AuthenticationDetailsDto({
    required this.userId,
    required this.accessJwtToken,
    required this.refreshJwtToken,
  });

  factory AuthenticationDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationDetailsDtoFromJson(json);

  @override
  AuthenticationDetails toDomain() => AuthenticationDetails(
        userId: userId,
        accessJwtToken: accessJwtToken,
        refreshJwtToken: refreshJwtToken ?? '',
      );
}
