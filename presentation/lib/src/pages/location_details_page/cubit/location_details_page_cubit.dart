import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_details_page_state.dart';

class LocationDetailsPageCubit extends Cubit<LocationDetailsPageState> {
  LocationDetailsPageCubit() : super(const LocationDetailsPageState());

  void startLoading() => emit(state.copyWith(
        isLoading: true,
        hasError: false,
      ));

  void updateLocation(Location location) => emit(state.copyWith(
        location: location,
        isLoading: false,
      ));

  void updateLocationFavoriteStatus(bool isFavorite) => emit(state.copyWith(
        location: state.location.copyWith(isFavorite: isFavorite),
      ));

  void setHasError() => emit(state.copyWith(hasError: false));
}
