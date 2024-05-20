import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/models/auth/authentication_details_dto.dart';
import 'package:data/src/models/users/new_user_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiAuthRepository implements AuthRepository {
  final Dio client;

  ApiAuthRepository(this.client);

  @override
  Future<FailureOrResult<AuthenticationDetails>> refreshToken(
    String refreshToken,
  ) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<AuthenticationDetails>> signUp(NewUser newUser) async {
    final response = await client.post(
      '/auth/sign-up',
      data: NewUserDto.fromDomain(newUser),
    );

    return response.toFailureOrResult(AuthenticationDetailsDto.fromJson);
  }
}
