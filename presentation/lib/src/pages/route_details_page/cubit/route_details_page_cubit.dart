import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'route_details_page_state.dart';

class RouteDetailsPageCubit extends Cubit<RouteDetailsPageState> {
  RouteDetailsPageCubit() : super(RouteDetailsPageInitial());
}
