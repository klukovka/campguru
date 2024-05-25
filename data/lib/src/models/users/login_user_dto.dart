import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_user_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class LoginUserDto {
  final String email;
  final String password;

  LoginUserDto({
    required this.email,
    required this.password,
  });

  factory LoginUserDto.fromDomain(LoginUser loginUser) => LoginUserDto(
        email: loginUser.email,
        password: loginUser.password,
      );

  Map<String, dynamic> toJson() => _$LoginUserDtoToJson(this);
}
