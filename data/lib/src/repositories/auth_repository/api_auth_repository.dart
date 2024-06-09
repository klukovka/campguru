import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/models/auth/authentication_details_dto.dart';
import 'package:data/src/models/users/login_user_dto.dart';
import 'package:data/src/models/users/new_user_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiAuthRepository implements AuthRepository {
  final Dio client;

  ApiAuthRepository(this.client);

  @override
  Future<FailureOrResult<AuthenticationDetails>> refreshToken(
    String refreshToken,
  ) async {
    final response = await client.post(
      '/auth/refresh-token',
      data: {'refresh_jwt_token': refreshToken},
    );

    return response.toFailureOrResult(AuthenticationDetailsDto.fromJson);
  }

  @override
  Future<FailureOrResult<AuthenticationDetails>> signUp(NewUser newUser) async {
    final response = await client.post(
      '/auth/sign-up',
      data: NewUserDto.fromDomain(newUser).toJson(),
    );

    return response.toFailureOrResult(AuthenticationDetailsDto.fromJson);
  }

  @override
  Future<FailureOrResult<AuthenticationDetails>> login(
    LoginUser loginUser,
  ) async {
    final response = await client.post(
      '/auth/sign-in',
      data: LoginUserDto.fromDomain(loginUser).toJson(),
    );
    return response.toFailureOrResult(AuthenticationDetailsDto.fromJson);
  }

  @override
  Future<FailureOrResult<void>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<void>> changePassword(PatchPassword patchPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
