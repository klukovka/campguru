import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/bloc.dart';
import 'package:presentation/src/controllers.dart';
import 'package:presentation/src/pages/routes/views/route_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class RoutesTab extends StatelessWidget implements AutoRouteWrapper {
  const RoutesTab({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RoutesTabCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<RoutesTabController>();
    return BlocBuilder<RoutesTabCubit, RoutesTabState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        isLoading: state.isLoading,
                        hintText: context.strings.searchRoutes,
                        search: (value) => controller.search(
                          state.filter,
                          value,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    FilterButton(
                      isNotEmpty: state.filter.isNotEmpty,
                      onPressed: () =>
                          context.appRouter.pushRoutesFiltersPage(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: state.isFirstLoading
                    ? const SkeletonListView()
                    : LoadMoreScrollListener(
                        loadMore: () => controller.uploadNextPage(state.filter),
                        child: ListView.builder(
                          itemBuilder: (context, index) => RouteTile(
                            route: state.routes[index],
                          ),
                          itemCount: state.routes.length,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
