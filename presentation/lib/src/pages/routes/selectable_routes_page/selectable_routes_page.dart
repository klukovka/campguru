import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/routes/views/route_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class SelectableRoutesPage extends StatefulWidget implements AutoRouteWrapper {
  final Route? route;
  const SelectableRoutesPage({
    super.key,
    this.route,
  });

  @override
  State<SelectableRoutesPage> createState() => _SelectableRoutesPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<FavoriteRoutesTabCubit>(),
      child: this,
    );
  }
}

class _SelectableRoutesPageState extends State<SelectableRoutesPage> {
  late Route? _selectedRoute;
  @override
  void initState() {
    super.initState();
    _selectedRoute = widget.route;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<FavoriteRoutesTabController>().initialLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<FavoriteRoutesTabController>();
    return BlocBuilder<FavoriteRoutesTabCubit, FavoriteRoutesTabState>(
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            onPop: () => context.appRouter.pop(),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField(
                  isLoading: state.isLoading,
                  hintText: context.strings.searchRoutes,
                  search: (value) => controller.search(
                    currentFilter: state.filter,
                    searchValue: value,
                  ),
                ),
              ),
              Expanded(
                child: state.isFirstLoading
                    ? const SkeletonListView()
                    : LoadMoreScrollListener(
                        loadMore: () => controller.uploadNextPage(state.filter),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final isSelected =
                                state.routes[index].id == _selectedRoute?.id;
                            return RouteTile(
                              route: state.routes[index],
                              buttonBelow: CheckButton(
                                isChecked: isSelected,
                                onPressed: () {
                                  setState(() {
                                    _selectedRoute =
                                        isSelected ? null : state.routes[index];
                                  });
                                  controller.selectRoute(_selectedRoute);
                                },
                              ),
                            );
                          },
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
