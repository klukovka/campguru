import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trips_tab_state.dart';

class TripsTabCubit extends Cubit<TripsTabState> {
  TripsTabCubit() : super(const TripsTabState());

  void setFilter(Filter filter) => emit(state.copyWith(
        filter: filter,
        isLoading: true,
      ));

  void setTrips(List<Trip> trips, {int? amount}) => emit(state.copyWith(
        trips: trips,
        isLoading: false,
        totslTripsAmount: amount,
      ));

  void appendTrips(List<Trip> trips) => emit(state.copyWith(
        trips: [...state.trips, ...trips],
        isLoading: false,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
