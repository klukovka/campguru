import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/locations/views/locations_list.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class FavoriteLocationsPage extends StatefulWidget implements AutoRouteWrapper {
  const FavoriteLocationsPage({
    super.key,
  });

  @override
  State<FavoriteLocationsPage> createState() => _FavoriteLocationsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<FavoriteLocationsPageCubit>(),
      child: this,
    );
  }
}

class _FavoriteLocationsPageState extends State<FavoriteLocationsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<FavoriteLocationsPageController>().initialLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<FavoriteLocationsPageController>();
    return BlocBuilder<FavoriteLocationsPageCubit, FavoriteLocationsPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            onPop: context.appRouter.pop,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField(
                  isLoading: state.isLoading,
                  //TODO: Localizations
                  hintText: 'Search Locations',
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
