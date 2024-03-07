import 'package:domain/src/entities/core/application_error_type.dart';
import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String? message;

  Failure({required this.message});
}

class ApplicationFailure extends Failure {
  final ApplicationErrorType type;

  ApplicationFailure({
    super.message,
    required this.type,
  });

  @override
  List<Object?> get props => [message];
}

class ApiFailure extends Failure {
  final String code;

  ApiFailure({
    required this.code,
    required String super.message,
  });

  @override
  List<Object?> get props => [code, message];
}
