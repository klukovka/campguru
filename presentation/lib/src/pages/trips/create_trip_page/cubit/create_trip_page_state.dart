part of 'create_trip_page_cubit.dart';

class CreateTripPageState extends Equatable {
  final Set<User> users;
  final Route? route;
  final bool isLoading;
  final Trip? trip;

  const CreateTripPageState({
    this.isLoading = false,
    this.route,
    this.users = const {},
    this.trip,
  });

  @override
  List<Object?> get props => [users, route, isLoading, trip];

  CreateTripPageState copyWith({
    Set<User>? users,
    Nullable<Route?>? route,
    bool? isLoading,
    Trip? trip,
  }) {
    return CreateTripPageState(
      users: users ?? this.users,
      route: route != null ? route.value : this.route,
      isLoading: isLoading ?? this.isLoading,
      trip: trip ?? this.trip,
    );
  }
}
