import 'package:domain/src/entities/core/failure.dart';
import 'package:equatable/equatable.dart';

class FailureOrResult<T> extends Equatable {
  final Failure? failure;
  final T? result;

  FailureOrResult({this.failure, this.result});

  FailureOrResult.failure(this.failure) : result = null;

  FailureOrResult.success(this.result) : failure = null;

  bool get hasFailed => failure != null;

  bool get wasSuccessful => failure == null;

  FailureOrResult<T2> map<T2>(T2 Function(T result) convert) {
    if (wasSuccessful) {
      return FailureOrResult.success(convert(result as T));
    } else {
      return FailureOrResult.failure(failure);
    }
  }

  @override
  List<Object?> get props => [failure, result];
}
