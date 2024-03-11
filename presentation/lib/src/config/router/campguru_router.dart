import 'package:presentation/src/config/router/app_auto_router.dart';
import 'package:presentation/src/config/router/app_auto_router.gr.dart';
import 'package:presentation/src/config/router/base_router.dart';

class CampguruRouter extends BaseRouter {
  CampguruRouter(AppAutoRouter super.stackRouter);

  Future<void> replaceToHomePage() => pushAndClearStack(const HomeRoute());

  Future<void> replaceToStartPage() => pushAndClearStack(const StartRoute());

  Future<void> pushLocationDetails(int id) =>
      push(LocationDetailsRoute(locationId: id));
}
