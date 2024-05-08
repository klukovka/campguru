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
    );
  }

  Widget _buildFiltersField(LocationsFiltersPageState state) {
    final List<FilterLabel> values =
        _fbValues[_LocationFiltersPageField.filters.name] ?? [];
    return FormBuilderCheckboxGroup(
      name: _LocationFiltersPageField.filters.name,
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
                    '${e.name}${state.isLabelAvailable(e) ? '' : ' (premium)'}'),
              ))
          .toList(),
    );
  }

  Widget _buildBottomNavigationBar(LocationsFiltersPageState state) {
    return Container(
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
              child: _buildResetButton(),
            ),
            Expanded(
              child: _buildApplyButton(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return TextButton(
      onPressed: () {
        _fbState?.patchValue({
          _LocationFiltersPageField.sortBy.name: null,
          _LocationFiltersPageField.filters.name: null,
        });
      },
      //TODO: Add localizations
      child: const Text('Reset'),
    );
  }

  Widget _buildApplyButton(LocationsFiltersPageState state) {
    return ElevatedButton(
      onPressed: state.isLoading
          ? null
          : () {
              _fbState?.save();
              context.locator<LocationFiltersPageController>().setFilters(
                    state.filter,
                    _fbValues[_LocationFiltersPageField.sortBy.name],
                    _fbValues[_LocationFiltersPageField.filters.name],
                  );
            },
      //TODO: Add localizations
      child: state.isLoading
          ? const Padding(
              padding: EdgeInsets.all(4),
              child: CircularProgressIndicator(),
            )
          : const Text('Apply'),
    );
  }
}
