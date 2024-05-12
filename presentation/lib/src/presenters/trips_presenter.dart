import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class TripsPresenter extends TripsOutputPort {
  final TripsTabCubit tripsTabCubit;
  // final TripDetailsPageCubit tripDetailsPageCubit;
  final TripsFiltersPageCubit tripsFiltersPageCubit;

  TripsPresenter({
    required this.tripsTabCubit,
    // required this.tripDetailsPageCubit,
    required this.tripsFiltersPageCubit,
  });

  @override
  void setAllTripsFilter(Filter filter) {
    tripsTabCubit.setFilter(filter);
    tripsFiltersPageCubit.updateCurrentFilter(filter);
  }

  @override
  void stopAllTripsLoading() {
    tripsTabCubit.stopLoading();
    tripsFiltersPageCubit.stopLoading();
  }

  @override
  void updateAllTrips(List<Trip> trips, int amount) {
    final append = tripsTabCubit.state.filter.append;

    if (append) {
      tripsTabCubit.appendTrips(trips);
    } else {
      tripsTabCubit.setTrips(trips, amount: amount);
    }

    tripsFiltersPageCubit.stopLoading();
  }

  @override
  void updateTripDetails(Trip trip) {
    final allTrips = tripsTabCubit.state.trips.merge(trip);

    tripsTabCubit.setTrips(allTrips);
    // tripDetailsPageCubit.updateTrip(trip);
  }

  @override
  void startTripDetailsLoading() {
    // tripDetailsPageCubit.startLoading();
  }

  @override
  void updateTripDetailsBriefly(int tripId) {
    final trip = tripsTabCubit.state.trips.firstWhereOrNull(
      (trip) => trip.id == tripId,
    );

    if (trip != null) {
      // tripDetailsPageCubit.updateTrip(trip);
    } else {
      // tripDetailsPageCubit.setHasError();
    }
  }
}
