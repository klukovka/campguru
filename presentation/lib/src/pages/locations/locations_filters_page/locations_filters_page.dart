import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/sort_by_extension.dart';

enum _LocationFiltersPageField {
  sortBy,
  filters,
}

@RoutePage()
class LocationsFiltersPage extends StatefulWidget implements AutoRouteWrapper {
  const LocationsFiltersPage({super.key});

  @override
  State<LocationsFiltersPage> createState() => _LocationsFiltersPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<LocationsFiltersPageCubit>(),
      child: this,
    );
  }
}

class _LocationsFiltersPageState extends State<LocationsFiltersPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationsFiltersPageCubit, LocationsFiltersPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final fields = [
          FormBuilderRadioGroup(
            name: _LocationFiltersPageField.sortBy.name,
            orientation: OptionsOrientation.vertical,
            initialValue: state.filter.sortBy,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,

              //TODO: Add localizations
              labelText: 'Sort By',
            ),
            options: [SortBy.rating, SortBy.routes, SortBy.reviews]
                .map(
                  (item) => FormBuilderFieldOption(
                    value: item,
                    child: Text(item.getLabel(context)),
                  ),
                )
                .toList(),
          ),
          FormBuilderCheckboxGroup(
            name: _LocationFiltersPageField.filters.name,
            orientation: OptionsOrientation.vertical,
            initialValue: state.filter.labels,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              //TODO: Add localizations
              labelText: 'Filter By',
            ),
            options: state.filterLabels
                .map((e) => FormBuilderFieldOption(
                      value: e,
                      child: Text(e.name),
                    ))
                .toList(),
          ),
        ];
        return Scaffold(
          //TODO: Add localizations
          appBar: AppBar(title: const Text('Filters')),
          body: FormBuilder(
            key: _fbKey,
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => fields[index],
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: fields.length,
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              color: Theme.of(context).navigationBarTheme.backgroundColor,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => _fbState?.reset(),
                      //TODO: Add localizations
                      child: const Text('Reset'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              _fbState?.save();
                              context
                                  .locator<LocationFiltersPageController>()
                                  .setFilters(
                                    state.filter,
                                    _fbValues[
                                        _LocationFiltersPageField.sortBy.name],
                                    _fbValues[
                                        _LocationFiltersPageField.filters.name],
                                  );
                            },
                      //TODO: Add localizations
                      child: state.isLoading
                          ? const Padding(
                              padding: EdgeInsets.all(4),
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Apply'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
