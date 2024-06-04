import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/locations/views/selectable_locations_list.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage<List<Location>>()
class SelectableLocationsPage extends StatefulWidget
    implements AutoRouteWrapper {
  final List<Location> selectedLocations;

  const SelectableLocationsPage({
    super.key,
    required this.selectedLocations,
  });

  @override
  State<SelectableLocationsPage> createState() =>
      _SelectableLocationsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<FavoriteLocationsPageCubit>(),
      child: this,
    );
  }
}

class _SelectableLocationsPageState extends State<SelectableLocationsPage> {
  late List<Location> _selectedLocations;

  @override
  void initState() {
    super.initState();
    _selectedLocations = widget.selectedLocations;
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
            onPop: () => context.appRouter.pop(_selectedLocations),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchField(
                  isLoading: state.isLoading,
                  hintText: context.strings.searchLocations,
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
                        child: SelectableLocationsList(
                          locations: state.locations,
                          selectedLocations: _selectedLocations,
                          onAdded: (value) {
                            setState(() {
                              _selectedLocations = [
                                ..._selectedLocations,
                                value
                              ];
                            });
                          },
                          onRemoved: (value) {
                            setState(() {
                              _selectedLocations = List.from(_selectedLocations)
                                ..removeWhere(
                                  (element) => element.id == value.id,
                                );
                            });
                          },
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
