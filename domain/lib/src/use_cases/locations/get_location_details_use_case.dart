import 'package:domain/domain.dart';

class GetLocationDetailsUseCase {
  final LocationsRepository locationsRepository;
  final ErrorHandlerOutputPort errorHandlerOutputPort;
  final LocationsOutputPort locationsOutputPort;

  GetLocationDetailsUseCase({
    required this.locationsRepository,
    required this.errorHandlerOutputPort,
    required this.locationsOutputPort,
  });

  Future<void> call(int locationId) async {
    locationsOutputPort.startLocationDetailsLoading();
    final locationDetails = await locationsRepository.getLocationDetails(
      locationId,
    );

    if (locationDetails.wasSuccessful) {
      locationsOutputPort.updateLocationDetails(locationDetails.result!);
      return;
    }

    errorHandlerOutputPort.setError(locationDetails.failure!);
    locationsOutputPort.updateLocationDetailsBriefly(locationId);
  }
}
