import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_own_routes_tab_state.dart';

class MyOwnRoutesTabCubit extends Cubit<MyOwnRoutesTabState> {
  MyOwnRoutesTabCubit() : super(const MyOwnRoutesTabState());

  void setFilter(Filter filter) => emit(state.copyWith(
        filter: filter,
        isLoading: true,
      ));

  void setRoutes(List<Route> routes, {int? amount}) => emit(state.copyWith(
        routes: routes,
        isLoading: false,
        totslRoutesAmount: amount,
      ));

  void appendRoutes(List<Route> routes) => emit(state.copyWith(
        routes: [...state.routes, ...routes],
        isLoading: false,
      ));

  void stopLoading() => emit(state.copyWith(isLoading: false));
}
