part of 'location_details_page_cubit.dart';

class LocationDetailsPageState extends Equatable {
  final Location location;
  final bool isLoading;
  final bool hasError;

  const LocationDetailsPageState({
    this.location = const Location(
      id: -1,
      images: [''],
      name: '',
      mark: 0,
      reviewsAmount: 0,
      isFavorite: false,
      lat: 0,
      lng: 0,
    ),
    this.isLoading = true,
    this.hasError = false,
  });

  @override
  List<Object> get props => [location, isLoading, hasError];

  LocationDetailsPageState copyWith({
    Location? location,
    bool? isLoading,
    bool? hasError,
  }) {
    return LocationDetailsPageState(
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
