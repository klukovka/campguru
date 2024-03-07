import 'package:domain/domain.dart';

class SplashPageController {
  final IsAuthorizedUseCase isAuthorizedUseCase;

  SplashPageController(this.isAuthorizedUseCase);

  void call() => isAuthorizedUseCase();
}
