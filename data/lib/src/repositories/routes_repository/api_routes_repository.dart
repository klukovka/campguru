import 'package:data/src/core/handle_response_extension.dart';
import 'package:data/src/filters/filter_serializer.dart';
import 'package:data/src/models/routes/new_route_dto.dart';
import 'package:data/src/models/routes/route_dto.dart';
import 'package:data/src/models/routes/route_preview_dto.dart';
import 'package:data/src/models/routes/routes_dto.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class ApiRoutesRepository implements RoutesRepository {
  final Dio client;

  ApiRoutesRepository(this.client);

  @override
  Future<FailureOrResult<void>> addRouteToFavorites(int id) async {
    final response = await client.post('/api/routes/$id/add-to-favourites');
    return response.toFailureOrResult((json) => null);
  }

  @override
  Future<FailureOrResult<Route>> createRoute(NewRoute newRoute) async {
    final response = await client.get(
      '/api/routes/preview',
      data: NewRouteDto.fromDomain(newRoute).toJson(),
    );
    return response.toFailureOrResult(RouteDto.fromJson);
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getAllRoutes(Filter filter) async {
    final query = FilterSerializer(filter).toString();
    final response = await client.get('/api/routes?$query');
    return response.toFailureOrResult(RoutesDto.fromJson);
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getFavoriteRoutes(Filter filter) async {
    final query = FilterSerializer(filter).toString();
    final response = await client.get('/api/routes/favourites?$query');
    return response.toFailureOrResult(RoutesDto.fromJson);
  }

  @override
  Future<FailureOrResult<Chunk<Route>>> getMyOwnRoutes(Filter filter) async {
    final query = FilterSerializer(filter).toString();
    final response = await client.get('/api/routes/my-own?$query');
    return response.toFailureOrResult(RoutesDto.fromJson);
  }

  @override
  Future<FailureOrResult<Route>> getRouteDetails(int id) async {
    final response = await client.get('/api/routes/$id');
    return response.toFailureOrResult(RouteDto.fromJson);
  }

  @override
  Future<FailureOrResult<RoutePreview>> getRoutePreview(
    List<int> locations,
  ) async {
    final response = await client.get(
      '/api/routes/preview',
      data: {'locations': locations},
    );
    return response.toFailureOrResult(RoutePreviewDto.fromJson);
  }

  @override
  Future<FailureOrResult<List<PremiumBasedFilterLabel>>>
      getRoutesFilterLabels() {
    // TODO: implement getRoutesFilterLabels
    throw UnimplementedError();
  }

  @override
  Future<FailureOrResult<void>> removeRouteFromFavorites(int id) async {
    final response =
        await client.post('/api/routes/$id/remove-from-favourites');
    return response.toFailureOrResult((json) => null);
  }
}
