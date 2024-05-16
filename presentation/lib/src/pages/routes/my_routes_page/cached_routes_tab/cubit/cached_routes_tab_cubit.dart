import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cached_routes_tab_state.dart';

class CachedRoutesTabCubit extends Cubit<CachedRoutesTabState> {
  CachedRoutesTabCubit() : super(const CachedRoutesTabState());

  void setSearchQuery(String searchQuery) => emit(state.copyWith(
        searchQuery: searchQuery,
      ));

  void setRoutes(List<Route> routes) => emit(state.copyWith(
        routes: routes,
      ));
}
