import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/src/utils/extensions/sort_by_extension.dart';

enum _LocationFiltersPageField {
  sortBy,
  filters,
}

@RoutePage()
class LocationFiltersPage extends StatefulWidget {
  const LocationFiltersPage({super.key});

  @override
  State<LocationFiltersPage> createState() => _LocationFiltersPageState();
}

class _LocationFiltersPageState extends State<LocationFiltersPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    final fields = [
      FormBuilderRadioGroup(
        name: _LocationFiltersPageField.sortBy.name,
        orientation: OptionsOrientation.vertical,
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
                  onPressed: () {},
                  //TODO: Add localizations
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
