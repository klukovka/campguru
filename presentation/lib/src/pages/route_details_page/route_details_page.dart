import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/pages/route_details_page/route_details_page_controller.dart';

@RoutePage()
class RouteDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final int routeId;

  const RouteDetailsPage({
    super.key,
    @PathParam('id') required this.routeId,
  });

  @override
  State<RouteDetailsPage> createState() => _RouteDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RouteDetailsPageCubit>(),
      child: this,
    );
  }
}

class _RouteDetailsPageState extends State<RouteDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<RouteDetailsPageController>()(widget.routeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
