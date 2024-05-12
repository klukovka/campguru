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

enum _TripsFiltersPageField {
  sortBy,
  filters,
}

@RoutePage()
class TripsFiltersPage extends StatefulWidget implements AutoRouteWrapper {
  const TripsFiltersPage({super.key});

  @override
  State<TripsFiltersPage> createState() => _TripsFiltersPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<TripsFiltersPageCubit>(),
      child: this,
    );
  }
}

class _TripsFiltersPageState extends State<TripsFiltersPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsFiltersPageCubit, TripsFiltersPageState>(
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

  Widget _buildSortByField(TripsFiltersPageState state) {
    return FormBuilderRadioGroup(
      name: _TripsFiltersPageField.sortBy.name,
      orientation: OptionsOrientation.vertical,
      initialValue: state.filter.sortBy,
      decoration: const InputDecoration(
        fillColor: Colors.transparent,

        //TODO: Add localizations
        labelText: 'Sort By',
      ),
      options: [SortBy.date, SortBy.distance, SortBy.users]
          .map(
            (item) => FormBuilderFieldOption(
              value: item,
              child: Text(item.getLabel(context)),
            ),
          )
          .toList(),
    );
  }

  Widget _buildFiltersField(TripsFiltersPageState state) {
    return FormBuilderCheckboxGroup(
      name: _TripsFiltersPageField.filters.name,
      orientation: OptionsOrientation.vertical,
      initialValue: state.filter.labels,
      decoration: const InputDecoration(
        fillColor: Colors.transparent,
        //TODO: Add localizations
        labelText: 'Filter By',
      ),
      options: [FilterLabel.showUncompleted]
          .map((e) => FormBuilderFieldOption(
                value: e,
                child: Text(e.getLabel(context)),
              ))
          .toList(),
    );
  }

  Widget _buildBottomNavigationBar(TripsFiltersPageState state) {
    return FilterButtons(
      onResetPressed: () {
        _fbState?.patchValue({
          _TripsFiltersPageField.sortBy.name: null,
          _TripsFiltersPageField.filters.name: null,
        });
      },
      onApplyPressed: () {
        _fbState?.save();
        context.locator<TripFiltersPageController>().setFilters(
              state.filter,
              _fbValues[_TripsFiltersPageField.sortBy.name],
              _fbValues[_TripsFiltersPageField.filters.name],
            );
      },
      isLoading: state.isLoading,
    );
  }
}
