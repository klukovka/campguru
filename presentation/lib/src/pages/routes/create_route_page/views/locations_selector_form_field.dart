import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/src/pages/routes/create_route_page/views/locations_selector_view.dart';

class LocationSelectorFormField extends FormBuilderField<List<Location>> {
  LocationSelectorFormField({
    super.key,
    required super.name,
    String? preview,
  }) : super(
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocationSelectorView(
                  preview: preview,
                  locations: state.value ?? [],
                  onChanged: (List<Location> value) => state.didChange(value),
                  onRemoved: (Location value) => state.didChange(
                    List.from(state.value ?? [])..remove(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    state.errorText ?? '',
                    style:
                        Theme.of(state.context).textTheme.labelMedium?.copyWith(
                              color: Theme.of(state.context).colorScheme.error,
                            ),
                  ),
                ),
              ],
            );
          },
        );
}
