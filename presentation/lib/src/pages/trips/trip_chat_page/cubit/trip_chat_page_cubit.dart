import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_chat_page_state.dart';

class TripChatPageCubit extends Cubit<TripChatPageState> {
  TripChatPageCubit() : super(const TripChatPageState());

  void updateTrip(Trip trip) => emit(state.copyWith(trip: trip));
}
