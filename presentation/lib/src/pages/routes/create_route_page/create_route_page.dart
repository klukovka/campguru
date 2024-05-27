import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/routes/create_route_page/views/locations_selector_form_field.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum CreateRoutePageField {
  name,
  description,
  private,
  locations,
}

@RoutePage()
class CreateRoutePage extends StatefulWidget implements AutoRouteWrapper {
  const CreateRoutePage({super.key});

  @override
  State<CreateRoutePage> createState() => _CreateRoutePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<CreateRoutePageCubit>()..resetState(),
      child: this,
    );
  }
}

class _CreateRoutePageState extends State<CreateRoutePage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    //TODO: Add localization
    return BlocConsumer<CreateRoutePageCubit, CreateRoutePageState>(
      listener: (context, state) {
        final routeId = state.routeId;
        if (!state.isSaving && !state.hasError && routeId != null) {
          context.appRouter.replaceRouteDetailsPage(routeId);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create Route')),
          body: AutovalidateModeNotificationBuilder(
            builder: (context, autovalidateMode, child) => FormBuilder(
              key: _fbKey,
              autovalidateMode: autovalidateMode,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          IntrinsicHeight(child: _buildLocationsField(state)),
                          const SizedBox(height: 12),
                          _buildNameField(),
                          const SizedBox(height: 12),
                          _buildDescriptionField(),
                          const SizedBox(height: 12),
                          _buildPrivateField(),
                          const Spacer(),
                          Builder(builder: (context) {
                            return _buildSaveButton(context, state);
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
      },
    );
  }

  Widget _buildLocationsField(CreateRoutePageState state) {
    return Row(
      children: [
        RoundedNetworkImage(
          width: 120,
          isLoading: state.isPreviewLoading,
          imageUrl: state.preview,
          useCachedImage: false,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: LocationSelectorFormField(
            name: CreateRoutePageField.locations.name,
            onChanged: context.locator<CreateRoutePageController>().getPreview,
            validator: (value) {
              if ((value?.length ?? 0) < 2) {
                return 'Select at least 2 locations';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNameField() {
    return FormBuilderTextField(
      name: CreateRoutePageField.name.name,
      maxLength: 30,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
      decoration: const InputDecoration(labelText: 'Name'),
    );
  }

  Widget _buildDescriptionField() {
    return FormBuilderTextField(
      name: CreateRoutePageField.description.name,
      maxLines: 4,
      maxLength: 120,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
      decoration: const InputDecoration(labelText: 'Description'),
    );
  }

  Widget _buildPrivateField() {
    return FormBuilderCheckbox(
      name: CreateRoutePageField.private.name,
      title: const Text('Private'),
      initialValue: false,
      decoration: const InputDecoration(),
    );
  }

  Widget _buildSaveButton(
    BuildContext context,
    CreateRoutePageState state,
  ) {
    final controller = context.locator<CreateRoutePageController>();

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
          if (_fbState?.saveAndValidate() ?? false) {
            controller.createRoute(
              NewRoute(
                locations: (_fbValues[CreateRoutePageField.locations.name]
                            as List<Location>?)
                        ?.map((e) => e.id)
                        .toList() ??
                    [],
                name: _fbValues[CreateRoutePageField.name.name] ?? '',
                description:
                    _fbValues[CreateRoutePageField.description.name] ?? '',
                isPrivate:
                    _fbValues[CreateRoutePageField.private.name] ?? false,
              ),
            );
          }
        },
        child: state.isSaving
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : const Text('Save'),
      ),
    );
  }
}
