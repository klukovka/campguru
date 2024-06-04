import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/credentials_validation_extension.dart';

enum EditProfilePageField {
  photo,
  name,
  surname,
  email,
  password,
  confirmPassword,
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
    //TODO: Add localizations
    return BlocConsumer<EditProfilePageCubit, EditProfilePageState>(
      listener: (context, state) {
        if (state.status == EditProfilePageStatus.success) {
          context.appRouter.replaceToSplashPage();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sign Up'),
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
                            ),
                            const SizedBox(height: 32),
                            _buildNameField(),
                            const SizedBox(height: 12),
                            _buildSurnameField(),
                            const SizedBox(height: 12),
                            _buildEmailField(),
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

  Widget _buildNameField() {
    return FormBuilderTextField(
      name: EditProfilePageField.name.name,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Name',
        prefixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  Widget _buildSurnameField() {
    return FormBuilderTextField(
      name: EditProfilePageField.surname.name,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Surname',
        prefixIcon: Icon(MdiIcons.account),
      ),
    );
  }

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: EditProfilePageField.email.name,
      validator: (value) => switch (value) {
        String? x when x == null || x.isEmpty => 'Email Address is required',
        String? x when !x!.isValidEmail =>
          'Email must be a valid email address',
        _ => null,
      },
      decoration: InputDecoration(
        labelText: 'Email',
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
              NewUser(
                email: _fbValues[EditProfilePageField.email.name],
                password: _fbValues[EditProfilePageField.password.name],
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
            : const Text('Complete'),
      ),
    );
  }
}
