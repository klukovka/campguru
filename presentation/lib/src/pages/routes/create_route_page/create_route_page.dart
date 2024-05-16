import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/src/pages/routes/create_route_page/views/locations_selector_form_field.dart';

enum _CreateRoutePageField {
  name,
  description,
  private,
  locations,
}

@RoutePage()
class CreateRoutePage extends StatefulWidget {
  const CreateRoutePage({super.key});

  @override
  State<CreateRoutePage> createState() => _CreateRoutePageState();
}

class _CreateRoutePageState extends State<CreateRoutePage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    //TODO: Add localization
    return Scaffold(
      appBar: AppBar(title: const Text('Create Route')),
      body: AutovalidateModeNotificationBuilder(
        builder: (context, autovalidateMode, child) => FormBuilder(
          key: _fbKey,
          autovalidateMode: autovalidateMode,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            const RoundedNetworkImage(width: 120),
                            const SizedBox(width: 12),
                            Expanded(
                              child: LocationSelectorFormField(
                                name: _CreateRoutePageField.locations.name,
                                onChanged: (value) {
                                  //TODO: Upload preview
                                },
                                validator: (value) {
                                  if ((value?.length ?? 0) < 2) {
                                    return 'Select at least 2 locations';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderTextField(
                        name: _CreateRoutePageField.name.name,
                        maxLength: 30,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Field is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderTextField(
                        name: _CreateRoutePageField.description.name,
                        maxLines: 4,
                        maxLength: 120,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Field is required';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      ),
                      const SizedBox(height: 12),
                      FormBuilderCheckbox(
                        name: _CreateRoutePageField.private.name,
                        title: const Text('Private'),
                        initialValue: false,
                        decoration: const InputDecoration(),
                      ),
                      const Spacer(),
                      Builder(builder: (context) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            bottom: MediaQuery.paddingOf(context).bottom,
                          ),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              AutovalidateModeNotification(
                                AutovalidateMode.onUserInteraction,
                              ).dispatch(context);
                              if (_fbState?.saveAndValidate() ?? false) {}
                            },
                            child: const Text('Save'),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
