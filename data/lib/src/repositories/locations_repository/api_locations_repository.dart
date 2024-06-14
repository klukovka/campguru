import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/filters/filter_serializer.dart';
import 'package:data/src/models/locations/location_dto.dart';
import 'package:data/src/models/locations/locations_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiLocationsRepository implements LocationsRepository {
  final Dio client;

  ApiLocationsRepository(this.client);

  @override
  Future<FailureOrResult<void>> addLocationToFavorites(int id) async {
    final response = await client.post('/api/locations/$id/add-to-favourites');
    return response.toFailureOrResult((json) => null);
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getAllLocations(
    Filter filter,
  ) async {
    final query = FilterSerializer(filter).toString();
    final response = await client.get('/api/locations?$query');
    return response.toFailureOrResult(LocationsDto.fromJson);
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getFavoriteLocations(
    Filter filter,
  ) async {
    // TODO: implement getFavoriteLocations
    final query = FilterSerializer(filter).toString();
    final response = await client.get('/api/locations?$query');
    return response.toFailureOrResult(LocationsDto.fromJson);
  }

  @override
  Future<FailureOrResult<Location>> getLocationDetails(int id) async {
    final response = await client.get('/api/locations/$id');
    return response.toFailureOrResult(LocationDto.fromJson);
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getLocationsFilterLabels() {
    // TODO: implement getLocationsFilterLabels
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<Chunk<Location>>> getRouteLocations(
    int routeId,
    Filter filter,
  ) async {
    final query = FilterSerializer(filter).toString();
    final response = await client.get('/api/routes/$routeId/locations?$query');
    return response.toFailureOrResult(LocationsDto.fromJson);
  }

  @override
  Future<FailureOrResult<void>> removeLocationFromFavorites(int id) async {
    final response = await client.post(
      '/api/locations/$id/remove-from-favourites',
    );
    return response.toFailureOrResult((json) => null);
  }
}
