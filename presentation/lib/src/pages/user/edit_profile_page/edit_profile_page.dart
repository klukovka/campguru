import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localizations/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/credentials_validation_extension.dart';

enum EditProfilePageField {
  photo,
  name,
  surname,
  email,
}

@RoutePage()
class EditProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<EditProfilePageCubit>(),
      child: this,
    );
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfilePageCubit, EditProfilePageState>(
      listener: (context, state) {
        if (state.status == EditProfilePageStatus.success) {
          context.appRouter.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.strings.editProfile),
          ),
          body: AutovalidateModeNotificationBuilder(
            builder: (context, autovalidateMode, child) => FormBuilder(
              key: _fbKey,
              autovalidateMode: autovalidateMode,
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            const Spacer(),
                            AvatarPickerFormField(
                              name: EditProfilePageField.photo.name,
                              radius: 52,
                              initialValue: state.user?.photo,
                            ),
                            const SizedBox(height: 32),
                            _buildNameField(state),
                            const SizedBox(height: 12),
                            _buildSurnameField(state),
                            const SizedBox(height: 12),
                            _buildEmailField(state),
                            const SizedBox(height: 12),
                            const Spacer(),
                            Builder(
                              builder: (context) => _buildSaveButton(
                                context,
                                isLoading: state.status ==
                                    EditProfilePageStatus.loading,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNameField(EditProfilePageState state) {
    return FormBuilderTextField(
      name: EditProfilePageField.name.name,
      initialValue: state.user?.name,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return context.strings.fieldRequired;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.strings.name,
        prefixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  Widget _buildSurnameField(EditProfilePageState state) {
    return FormBuilderTextField(
      name: EditProfilePageField.surname.name,
      initialValue: state.user?.surname,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return context.strings.fieldRequired;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.strings.surname,
        prefixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  Widget _buildEmailField(EditProfilePageState state) {
    return FormBuilderTextField(
      name: EditProfilePageField.email.name,
      initialValue: state.user?.email,
      validator: (value) => switch (value) {
        String? x when x == null || x.isEmpty => context.strings.surname,
        String? x when !x!.isValidEmail => context.strings.emailMustBeValid,
        _ => null,
      },
      decoration: InputDecoration(
        labelText: context.strings.email,
        prefixIcon: Icon(MdiIcons.email),
      ),
    );
  }

  Widget _buildSaveButton(
    BuildContext context, {
    required bool isLoading,
  }) {
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
            context.locator<EditProfilePageController>()(
              PatchUser(
                email: _fbValues[EditProfilePageField.email.name],
                name: _fbValues[EditProfilePageField.name.name],
                surname: _fbValues[EditProfilePageField.surname.name],
                photo: _fbValues[EditProfilePageField.photo.name],
              ),
            );
          }
        },
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : Text(context.strings.save),
      ),
    );
  }
}
