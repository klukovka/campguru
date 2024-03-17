import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';
import 'package:presentation/src/views/locations/locations_list.dart';

@RoutePage()
class RouteLocationsPage extends StatefulWidget implements AutoRouteWrapper {
  final int routeId;
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<RouteLocationsPageController>().initialLoading(
            widget.routeId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<RouteLocationsPageController>();
    return BlocBuilder<RouteLocationsPageCubit, RouteLocationsPageState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField(
                  //TODO: Localizations
                  hintText: 'Search Locations',
                  search: (value) => controller.search(
                    widget.routeId,
                    currentFilter: state.filter,
                    searchValue: value,
                  ),
                ),
              ),
              Expanded(
                child: state.isFirstLoading
                    ? const SkeletonListView()
                    : LoadMoreScrollListener(
                        loadMore: () => controller.uploadNextPage(
                            widget.routeId, state.filter),
                        child: LocationsList(locations: state.locations),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
