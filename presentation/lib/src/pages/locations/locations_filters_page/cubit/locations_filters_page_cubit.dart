import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locations_filters_page_state.dart';

class LocationsFiltersPageCubit extends Cubit<LocationsFiltersPageState> {
  LocationsFiltersPageCubit() : super(const LocationsFiltersPageState());

  void updateCurrentFilter(Filter filter) => state.copyWith(
        filter: filter,
        isLoading: true,
      );

  void updateLabels(List<LocationFilterLabel> labels) => state.copyWith(
        labels: labels,
      );

  void stopLoading() => state.copyWith(isLoading: false);
}
