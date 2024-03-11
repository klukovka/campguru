import 'package:domain/domain.dart';

abstract class ErrorHandlerOutputPort {
  void setError(Failure failure);
}
