import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class ControllersModule {
  @lazySingleton
  SplashPageController getSplashPageController(
    IsAuthorizedUseCase isAuthorizedUseCase,
  ) =>
      SplashPageController(isAuthorizedUseCase);
}
