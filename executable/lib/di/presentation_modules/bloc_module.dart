import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class BlocModule {
  @lazySingleton
  SplashPageCubit get splashPageCubit => SplashPageCubit();
}
