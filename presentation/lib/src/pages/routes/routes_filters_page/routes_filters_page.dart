import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/filter_label_extension.dart';
import 'package:presentation/src/utils/extensions/sort_by_extension.dart';

enum _RoutesFiltersPageField {
  sortBy,
  distance,
  filters,
}

@RoutePage()
class RoutesFiltersPage extends StatefulWidget implements AutoRouteWrapper {
  const RoutesFiltersPage({super.key});

  @override
  State<RoutesFiltersPage> createState() => _RoutesFiltersPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RoutesFiltersPageCubit>(),
      child: this,
    );
  }
}

class _RoutesFiltersPageState extends State<RoutesFiltersPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutesFiltersPageCubit, RoutesFiltersPageState>(
      builder: (context, state) {
        final fields = [
          _buildSortByField(state),
          _buildDistanceField(state),
          _buildFiltersField(state),
        ];
        return Scaffold(
          appBar: AppBar(title: Text(context.strings.filters)),
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

  Widget _buildDistanceField(RoutesFiltersPageState state) {
    return FormBuilderRangeSlider(
      name: _RoutesFiltersPageField.distance.name,
      min: 0,
      max: 5000,
      enabled: state.hasPremium,
      initialValue: state.distance,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        labelText: context.strings.distanceMertes,
        helperText: state.hasPremium
            ? null
            : context.strings.onlyForUsersWithSubscription,
      ),
    );
  }

  Widget _buildSortByField(RoutesFiltersPageState state) {
    return FormBuilderRadioGroup(
      name: _RoutesFiltersPageField.sortBy.name,
      orientation: OptionsOrientation.vertical,
      initialValue: state.filter.sortBy,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        labelText: context.strings.sortBy,
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

  Widget _buildFiltersField(RoutesFiltersPageState state) {
    final List<FilterLabel> values =
        _fbValues[_RoutesFiltersPageField.filters.name] ?? [];
    return FormBuilderCheckboxGroup(
      name: _RoutesFiltersPageField.filters.name,
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
        labelText: context.strings.filterBy,
        helperText: values.length < 3 && !state.hasPremium
            ? null
            : context.strings.onlyThreeFiltersSimultaneously,
        helperMaxLines: 2,
      ),
      options: state.filterLabels
          .map((e) => FormBuilderFieldOption(
                value: e,
                child: Text(
                    '${e.getLabel(context)}${state.isLabelAvailable(e) ? '' : ' (${context.strings.premium})'}'),
              ))
          .toList(),
    );
  }

  Widget _buildBottomNavigationBar(RoutesFiltersPageState state) {
    return FilterButtons(
      onResetPressed: () {
        _fbState?.patchValue({
          _RoutesFiltersPageField.sortBy.name: null,
          _RoutesFiltersPageField.filters.name: null,
          _RoutesFiltersPageField.distance.name: const RangeValues(0, 0),
        });
      },
      onApplyPressed: () {
        _fbState?.save();
        context.locator<RouteFiltersPageController>().setFilters(
              state.filter,
              _fbValues[_RoutesFiltersPageField.sortBy.name],
              _fbValues[_RoutesFiltersPageField.filters.name],
              _fbValues[_RoutesFiltersPageField.distance.name],
            );
      },
      isLoading: state.isLoading,
    );
  }
}
