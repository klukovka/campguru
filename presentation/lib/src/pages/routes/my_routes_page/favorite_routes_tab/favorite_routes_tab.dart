import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/routes/views/route_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class FavoriteRoutesTab extends StatefulWidget implements AutoRouteWrapper {
  const FavoriteRoutesTab({
    super.key,
  });

  @override
  State<FavoriteRoutesTab> createState() => _FavoriteRoutesTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<FavoriteRoutesTabCubit>(),
      child: this,
    );
  }
}

class _FavoriteRoutesTabState extends State<FavoriteRoutesTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<FavoriteRoutesTabController>().initialLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<FavoriteRoutesTabController>();
    return BlocBuilder<FavoriteRoutesTabCubit, FavoriteRoutesTabState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchField(
                isLoading: state.isLoading,
                //TODO: Localizations
                hintText: 'Search Routes',
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
                        itemBuilder: (context, index) => RouteTile(
                          route: state.routes[index],
                        ),
                        itemCount: state.routes.length,
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
