import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locations_tab_state.dart';

class LocationsTabCubit extends Cubit<LocationsTabState> {
  LocationsTabCubit() : super(const LocationsTabState());

  void setFilter(Filter filter) => emit(state.copyWith(
        filter: filter,
        isLoading: true,
      ));

  void setLocations(List<Location> locations, {int? amount}) =>
      emit(state.copyWith(
        locations: locations,
        isLoading: false,
        totslLocationsAmount: amount,
      ));

  void appendLocations(List<Location> locations) => emit(state.copyWith(
        locations: [...state.locations, ...locations],
        isLoading: false,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
