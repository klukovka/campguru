import 'package:injectable/injectable.dart';
import 'package:presentation/presentation.dart';

@module
abstract class BlocModule {
  @lazySingleton
  SplashPageCubit get splashPageCubit => SplashPageCubit();

  @lazySingleton
  HomePageCubit get homePageCubit => HomePageCubit();

  @lazySingleton
  LocationsTabCubit get locationsTabCubit => LocationsTabCubit();

  @lazySingleton
  LocationDetailsPageCubit get locationDetailsPageCubit =>
      LocationDetailsPageCubit();

  @lazySingleton
  LocationReviewsPageCubit get locationReviewsPageCubit =>
      LocationReviewsPageCubit();

  @lazySingleton
  RoutesTabCubit get routesTabCubit => RoutesTabCubit();

  @lazySingleton
  RouteDetailsPageCubit get routeDetailsPageCubit => RouteDetailsPageCubit();
}
