import 'package:domain/domain.dart';

abstract class RoutesOutputPort {
  void setAllRoutesFilter(Filter filter);
  void updateAllRoutes(List<Route> routes, int amount);
  void stopAllRoutesLoading();
  void updateRouteFavoriteStatus(int routeId, bool isFavorite);
  void startRouteDetailsLoading();
  void updateRouteDetails(Route route);
  void updateRouteDetailsBriefly(int routeId);
  void updateRoutesAvailableFilters(List<PremiumBasedFilterLabel> labels);
  void updatePremiumStatus(bool hasPremium);
}
