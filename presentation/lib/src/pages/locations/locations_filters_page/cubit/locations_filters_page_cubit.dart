import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locations_filters_page_state.dart';

class LocationsFiltersPageCubit extends Cubit<LocationsFiltersPageState> {
  LocationsFiltersPageCubit() : super(const LocationsFiltersPageState());

  void updateCurrentFilter(Filter filter) => emit(state.copyWith(
        filter: filter,
        isLoading: true,
      ));

  void updateLabels(List<LocationFilterLabel> labels) => emit(state.copyWith(
        labels: labels,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));

  void updatePremiumStatus(bool hasPremium) => emit(state.copyWith(
        hasPremium: hasPremium,
      ));
}
