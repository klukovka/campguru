import 'package:domain/domain.dart';

abstract class CacheRepository {
  Stream<(double progress, bool isCompleted)> saveRoute(Route route);
  List<Route> getCachedRoutes({String searchQuery = ''});
  Future<FailureOrResult<void>> deleteRoute(int routeId);
  Future<FailureOrResult<void>> clearRoutes();
  Route getRoute(int id);
}
