import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_locations_page_state.dart';

class FavoriteLocationsPageCubit extends Cubit<FavoriteLocationsPageState> {
  FavoriteLocationsPageCubit() : super(const FavoriteLocationsPageState());

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
