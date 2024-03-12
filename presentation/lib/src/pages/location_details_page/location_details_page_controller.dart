import 'package:domain/domain.dart';

class LocationDetailsPageController {
  final GetLocationDetailsUseCase getLocationDetailsUseCase;

  LocationDetailsPageController(this.getLocationDetailsUseCase);

  void call(int locationId) {
    getLocationDetailsUseCase(locationId);
  }
}
