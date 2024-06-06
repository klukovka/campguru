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

  @lazySingleton
  RouteLocationsPageCubit get routeLocationsPageCubit =>
      RouteLocationsPageCubit();

  @lazySingleton
  RouteReviewsPageCubit get routeReviewsPageCubit => RouteReviewsPageCubit();

  @lazySingleton
  LocationsFiltersPageCubit get locationsFiltersPageCubit =>
      LocationsFiltersPageCubit();

  @lazySingleton
  RoutesFiltersPageCubit get routesFiltersPageCubit => RoutesFiltersPageCubit();

  @lazySingleton
  ProfileTabCubit get profileTabCubit => ProfileTabCubit();

  @lazySingleton
  TripsTabCubit get tripsTabCubit => TripsTabCubit();

  @lazySingleton
  TripsFiltersPageCubit get tripsFiltersPageCubit => TripsFiltersPageCubit();

  @lazySingleton
  TripDetailsPageCubit get tripDetailsPageCubit => TripDetailsPageCubit();

  @lazySingleton
  RouteCacheProgressViewCubit get routeCacheProgressViewCubit =>
      RouteCacheProgressViewCubit();

  @lazySingleton
  RouteMapPageCubit get routeMapPageCubit => RouteMapPageCubit();

  @lazySingleton
  FavoriteLocationsPageCubit get favoriteLocationsPageCubit =>
      FavoriteLocationsPageCubit();

  @lazySingleton
  CreateRoutePageCubit get createRoutePageCubit => CreateRoutePageCubit();

  @lazySingleton
  FavoriteRoutesTabCubit get favoriteRoutesTabCubit => FavoriteRoutesTabCubit();

  @lazySingleton
  MyOwnRoutesTabCubit get myOwnRoutesTabCubit => MyOwnRoutesTabCubit();

  @lazySingleton
  CachedRoutesTabCubit get cachedRoutesTabCubit => CachedRoutesTabCubit();

  @lazySingleton
  SignUpPageCubit get signUpPageCubit => SignUpPageCubit();

  @lazySingleton
  StartPageCubit get startPageCubit => StartPageCubit();

  @lazySingleton
  AppControlCubit get appControlCubit => AppControlCubit();

  @lazySingleton
  CachedRouteDetailsPageCubit get cachedRouteDetailsPageCubit =>
      CachedRouteDetailsPageCubit();

  @lazySingleton
  CachedRouteMapPageCubit get cachedRouteMapPageCubit =>
      CachedRouteMapPageCubit();

  @lazySingleton
  CreateTripPageCubit get createTripPageCubit => CreateTripPageCubit();

  @lazySingleton
  TripChatPageCubit get tripChatPageCubit => TripChatPageCubit();

  @lazySingleton
  EditProfilePageCubit get editProfilePageCubit => EditProfilePageCubit();

  @lazySingleton
  SubscriptionPageCubit get subscriptionPageCubit => SubscriptionPageCubit();

  @lazySingleton
  CreateReviewPageCubit get createReviewPageCubit => CreateReviewPageCubit();
}
