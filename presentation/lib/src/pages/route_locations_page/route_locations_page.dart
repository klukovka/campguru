import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';

@RoutePage()
class RouteLocationsPage extends StatefulWidget implements AutoRouteWrapper {
  final String routeId;
  const RouteLocationsPage({
    super.key,
    @PathParam('id') required this.routeId,
  });

  @override
  State<RouteLocationsPage> createState() => _RouteLocationsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RouteLocationsPageCubit>(),
      child: this,
    );
  }
}

class _RouteLocationsPageState extends State<RouteLocationsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
