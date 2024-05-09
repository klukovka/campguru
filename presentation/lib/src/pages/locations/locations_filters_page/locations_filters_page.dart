import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/filter_label_extension.dart';
import 'package:presentation/src/utils/extensions/sort_by_extension.dart';

enum _LocationsFiltersPageField {
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
    return BlocBuilder<LocationsFiltersPageCubit, LocationsFiltersPageState>(
      builder: (context, state) {
        final fields = [
          _buildSortByField(state),
          _buildFiltersField(state),
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
          bottomNavigationBar: _buildBottomNavigationBar(state),
        );
      },
    );
  }

  Widget _buildSortByField(LocationsFiltersPageState state) {
    return FormBuilderRadioGroup(
      name: _LocationsFiltersPageField.sortBy.name,
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
    );
  }

  Widget _buildFiltersField(LocationsFiltersPageState state) {
    final List<FilterLabel> values =
        _fbValues[_LocationsFiltersPageField.filters.name] ?? [];
    return FormBuilderCheckboxGroup(
      name: _LocationsFiltersPageField.filters.name,
      orientation: OptionsOrientation.vertical,
      initialValue: state.filter.labels,
      disabled: state.getDisabledLabels(values),
      onChanged: (value) {
        if (!state.hasPremium) {
          setState(() {
            _fbState?.save();
          });
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        //TODO: Add localizations
        labelText: 'Filter By',
        helperText: values.length < 3 && !state.hasPremium
            ? null
            : '* users without subscription can select only 3 filters simultaneously',
        helperMaxLines: 2,
      ),
      options: state.filterLabels
          .map((e) => FormBuilderFieldOption(
                value: e,
                child: Text(
                    '${e.getLabel(context)}${state.isLabelAvailable(e) ? '' : ' (premium)'}'),
              ))
          .toList(),
    );
  }

  Widget _buildBottomNavigationBar(LocationsFiltersPageState state) {
    return FilterButtons(
      onResetPressed: () {
        _fbState?.patchValue({
          _LocationsFiltersPageField.sortBy.name: null,
          _LocationsFiltersPageField.filters.name: null,
        });
      },
      onApplyPressed: () {
        _fbState?.save();
        context.locator<LocationFiltersPageController>().setFilters(
              state.filter,
              _fbValues[_LocationsFiltersPageField.sortBy.name],
              _fbValues[_LocationsFiltersPageField.filters.name],
            );
      },
      isLoading: state.isLoading,
    );
  }
}
