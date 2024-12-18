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

enum SignUpPageField {
  photo,
  name,
  surname,
  email,
  password,
  confirmPassword,
}

@RoutePage()
class SignUpPage extends StatefulWidget implements AutoRouteWrapper {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<SignUpPageCubit>(),
      child: this,
    );
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpPageCubit, SignUpPageState>(
      listener: (context, state) {
        if (state.status == SignUpPageStatus.success) {
          context.appRouter.replaceToSplashPage();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.strings.signUp),
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
                              name: SignUpPageField.photo.name,
                              radius: 52,
                            ),
                            const SizedBox(height: 32),
                            _buildNameField(),
                            const SizedBox(height: 12),
                            _buildSurnameField(),
                            const SizedBox(height: 12),
                            _buildEmailField(),
                            const SizedBox(height: 12),
                            _buildPasswordField(),
                            const SizedBox(height: 12),
                            _buildConfirmPasswordField(),
                            const SizedBox(height: 12),
                            const Spacer(),
                            Builder(
                              builder: (context) => _buildSaveButton(
                                context,
                                isLoading:
                                    state.status == SignUpPageStatus.loading,
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
      name: SignUpPageField.name.name,
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

  Widget _buildSurnameField() {
    return FormBuilderTextField(
      name: SignUpPageField.surname.name,
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

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: SignUpPageField.email.name,
      validator: (value) => switch (value) {
        String? x when x == null || x.isEmpty =>
          context.strings.emailAddressRequired,
        String? x when !x!.isValidEmail => context.strings.emailMustBeValid,
        _ => null,
      },
      decoration: InputDecoration(
        labelText: context.strings.email,
        prefixIcon: Icon(MdiIcons.email),
      ),
    );
  }

  Widget _buildPasswordField() {
    return FormBuilderTextField(
      name: SignUpPageField.password.name,
      onChanged: (value) => _fbState?.save(),
      obscureText: true,
      validator: (value) => switch (value) {
        String? x when x == null || x.isEmpty =>
          context.strings.passwordRequired,
        String x when !x.isPasswordValid =>
          context.strings.passwordRequirements,
        String x
            when !RegExp(
                    r'''^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[ !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~])[A-Za-z\d !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]{8,}$''')
                .hasMatch(x) =>
          context.strings.passwordTooSimple,
        _ => null,
      },
      decoration: InputDecoration(
        labelText: context.strings.password,
        prefixIcon: Icon(MdiIcons.key),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return FormBuilderTextField(
      name: SignUpPageField.confirmPassword.name,
      obscureText: true,
      validator: (value) {
        if (value != _fbValues[SignUpPageField.password.name]) {
          return context.strings.passwordsNotMatch;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.strings.confirmPassword,
        prefixIcon: Icon(MdiIcons.key),
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
            context.locator<SignUpPageController>()(
              NewUser(
                email: _fbValues[SignUpPageField.email.name],
                password: _fbValues[SignUpPageField.password.name],
                name: _fbValues[SignUpPageField.name.name],
                surname: _fbValues[SignUpPageField.surname.name],
                photo: _fbValues[SignUpPageField.photo.name],
              ),
            );
          }
        },
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : Text(context.strings.complete),
      ),
    );
  }
}
