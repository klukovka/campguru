import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
          child: child!,
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          children: [
            FormBuilderTextField(
              name: _CreateRoutePageField.name.name,
              maxLength: 30,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Field is required';
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
                if (value?.isEmpty ?? true) return 'Field is required';
                return null;
              },
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 12),
            FormBuilderCheckbox(
              name: _CreateRoutePageField.private.name,
              title: const Text('Private'),
              decoration: const InputDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
