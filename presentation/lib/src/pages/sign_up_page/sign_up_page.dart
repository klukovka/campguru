import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum SignUpPageField {
  photo,
  name,
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
    //TODO: Add localizations
    return BlocConsumer<SignUpPageCubit, SignUpPageState>(
      listener: (context, state) {
        if (state.status == SignUpPageStatus.success) {
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
                          vertical: 24, horizontal: 16),
                      sliver: SliverFillRemaining(
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

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: SignUpPageField.email.name,
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

  Widget _buildPasswordField() {
    return FormBuilderTextField(
      name: SignUpPageField.password.name,
      onChanged: (value) => _fbState?.save(),
      obscureText: true,
      validator: (value) => switch (value) {
        String? x when x == null || x.isEmpty => 'Password is required',
        String x when !x.isPasswordValid =>
          'Passwords must include at least 8 characters combining\nlower and uppercase letters, numbers, and symbols.',
        String x
            when !RegExp(
                    r'''^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[ !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~])[A-Za-z\d !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]{8,}$''')
                .hasMatch(x) =>
          'Password is too simple',
        _ => null,
      },
      decoration: InputDecoration(
        labelText: 'Password',
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
          return 'Passwords do not match';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm Password',
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
                photo: (_fbValues[SignUpPageField.photo.name] as PickedImage?)
                    ?.bytes,
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

extension on String {
  //TODO: Extract
  bool get isValidEmail {
    final regex =
        RegExp(r"^[a-zA-Z0-9._-]+[\+\d+]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");

    return regex.hasMatch(this);
  }

  bool get isPasswordValid {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$',
    );

    return passwordRegex.hasMatch(this);
  }
}
