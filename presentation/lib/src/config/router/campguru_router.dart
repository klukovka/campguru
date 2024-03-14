import 'package:presentation/src/config/router/app_auto_router.dart';
import 'package:presentation/src/config/router/app_auto_router.gr.dart';
import 'package:presentation/src/config/router/base_router.dart';

class CampguruRouter extends BaseRouter {
  CampguruRouter(AppAutoRouter super.stackRouter);

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

  Future<void> pushRouteDetailsPage(int id) async {
    //TODO: Implement
  }
}
