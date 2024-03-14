import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routes_tab_state.dart';

class RoutesTabCubit extends Cubit<RoutesTabState> {
  RoutesTabCubit() : super(RoutesTabCubitInitial());
}
