import 'package:domain/domain.dart';
import 'package:presentation/src/config/router/app_auto_router.dart';
import 'package:presentation/src/config/router/app_auto_router.gr.dart';
import 'package:presentation/src/config/router/base_router.dart';

class CampguruRouter extends BaseRouter {
  CampguruRouter(AppAutoRouter super.stackRouter);

  Future<void> replaceToSplashPage() => pushAndClearStack(const SplashRoute());

  Future<void> replaceToHomePage() => pushAndClearStack(const HomeRoute());

  Future<void> replaceToStartPage() => pushAndClearStack(const StartRoute());

  Future<void> pushLocationDetailsPage(int id) =>
      push(LocationDetailsRoute(locationId: id));

  Future<void> pushLocationReviewsPage(int id) =>
      push(LocationReviewsRoute(locationId: id));

  Future<void> pushLocationMap({double? lat, double? lng}) => push(
        LocationMapRoute(
          lat: lat ?? 0,
          lng: lng ?? 0,
        ),
      );

  Future<void> pushRouteDetailsPage(int id) =>
      push(RouteDetailsRoute(routeId: id));

  Future<void> pushRouteLocationsPage(int id) =>
      push(RouteLocationsRoute(routeId: id));

  Future<void> pushRouteReviewsPage(int id) =>
      push(RouteReviewsRoute(routeId: id));

  Future<void> pushRouteMap(int id) => push(RouteMapRoute(routeId: id));

  Future<void> pushLocationsFiltersPage() =>
      push(const LocationsFiltersRoute());

  Future<void> pushRoutesFiltersPage() => push(const RoutesFiltersRoute());

  Future<void> pushTripsFiltersPage() => push(const TripsFiltersRoute());

  Future<void> pushTripDetailsPage(int id) =>
      push(TripDetailsRoute(tripId: id));

  Future<void> pushTripChatPage(int id) => push(TripChatRoute(tripId: id));

  Future<void> replaceTripDetailsPage(int id) =>
      replaceLast([TripDetailsRoute(tripId: id)]);

  Future<void> pushFavoriteLocationsPage() =>
      push(const FavoriteLocationsRoute());

  Future<void> pushCreateRoutePage() => push(const CreateRouteRoute());

  Future<List<Location>?> pushSelectableLocationsPage(
    List<Location> selectedLocations,
  ) =>
      push<List<Location>>(
        SelectableLocationsRoute(selectedLocations: selectedLocations),
      );

  Future<void> replaceRouteDetailsPage(int id) =>
      replace(RouteDetailsRoute(routeId: id));

  Future<void> pushMyRoutesPage() => push(const MyRoutesRoute());

  Future<void> pushSignUpPage() => push(const SignUpRoute());

  Future<void> pushErrorDialog({
    required String title,
    required String message,
  }) =>
      push(AppUnexpectedErrorRoute(
        title: title,
        message: message,
      ));

  Future<void> pushCachedRouteDetailsPage(int id) =>
      push(CachedRouteDetailsRoute(routeId: id));

  Future<void> pushCachedRouteMap(int id) => push(
        CachedRouteMapRoute(routeId: id),
      );

  Future<void> pushCreateTripPage() => push(const CreateTripRoute());

  Future<void> pushSelectableRoutePage(Route? route) => push(
        SelectableRoutesRoute(route: route),
      );

  Future<void> pushEditProfilePage() => push(const EditProfileRoute());

  Future<void> pushLanguageDialog() => push(const LanguageRoute());

  Future<void> pushThemeDialog() => push(const ThemeRoute());

  Future<void> pushSubscriptionPage() => push(const SubscriptionRoute());

  Future<void> pushCreateLocationReviewPage(int id) =>
      push(CreateLocationReviewRoute(id: id));

  Future<void> pushCreateRouteReviewPage(int id) =>
      push(CreateRouteReviewRoute(id: id));

  Future<void> pushResetPasswordPage() => push(const ResetPasswordRoute());

  Future<void> pushChangePasswordPage() => push(const ChangePasswordRoute());
}
