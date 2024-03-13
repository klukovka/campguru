import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_reviews_page_state.dart';

class LocationReviewsPageCubit extends Cubit<LocationReviewsPageState> {
  LocationReviewsPageCubit() : super(LocationReviewsPageInitial());
}
