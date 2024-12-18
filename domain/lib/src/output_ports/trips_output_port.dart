import 'package:domain/domain.dart';

abstract class TripsOutputPort {
  void setAllTripsFilter(Filter filter);
  void updateAllTrips(List<Trip> trips, int amount);
  void stopAllTripsLoading();
  void startTripDetailsLoading();
  void updateTripDetails(Trip trip);
  void updateTripDetailsBriefly(int tripId);
  void startCompeteTrip();
  void setTripRoute(Route? route);
  void startCreateTripLoading();
  void completeTripCreation(Trip trip);
  void stopCreateTripLoading();
}
