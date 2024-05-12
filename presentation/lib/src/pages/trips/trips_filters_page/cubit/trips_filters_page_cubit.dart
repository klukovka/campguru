import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trips_filters_page_state.dart';

class TripsFiltersPageCubit extends Cubit<TripsFiltersPageState> {
  TripsFiltersPageCubit() : super(const TripsFiltersPageState());

  void updateCurrentFilter(Filter filter) => emit(state.copyWith(
        filter: filter,
        isLoading: true,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
