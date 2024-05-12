import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_details_page_state.dart';

class TripDetailsPageCubit extends Cubit<TripDetailsPageState> {
  TripDetailsPageCubit()
      : super(
          TripDetailsPageState(
            trip: Trip(
              id: -1,
              name: '',
              date: DateTime.now(),
              completed: true,
              route: const Route(
                id: -1,
                name: '',
                mark: -1,
                mapUrl: '',
                distance: 0,
                duration: 0,
                isFavorite: false,
                reviewsAmount: 4,
              ),
              users: [],
              usersAmount: 0,
            ),
          ),
        );

  void startLoading() => emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));

  void updateTrip(Trip trip) => emit(state.copyWith(
        trip: trip,
        isLoading: false,
      ));

  void setHasError() => emit(state.copyWith(hasError: false));
}
