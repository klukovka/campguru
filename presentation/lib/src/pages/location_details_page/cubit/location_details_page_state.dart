part of 'location_details_page_cubit.dart';

class LocationDetailsPageState extends Equatable {
  final Location location;
  final bool isLoading;

  const LocationDetailsPageState({
    this.location = const Location(
      id: -1,
      images: [],
      name: '',
      mark: 0,
      reviewsAmount: 0,
      isFavorite: false,
    ),
    this.isLoading = true,
  });

  @override
  List<Object> get props => [location, isLoading];

  LocationDetailsPageState copyWith({
    Location? location,
    bool? isLoading,
  }) {
    return LocationDetailsPageState(
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
