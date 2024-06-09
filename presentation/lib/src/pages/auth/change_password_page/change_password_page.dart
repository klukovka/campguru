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

enum ChangePasswordPageField {
  oldPassword,
  newPassword,
  confirmPassword,
}

@RoutePage()
class ChangePasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<ChangePasswordPageCubit>(),
      child: this,
    );
  }
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordPageCubit, ChangePasswordPageState>(
      listener: (context, state) {
        if (state.status == ChangePasswordPageStatus.success) {
          context
            ..toasts.showSuccess(
              message: context.strings.passwordWasSuccessfullyUpdated,
            )
            ..appRouter.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.strings.changePassword),
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
                            _buildOldPasswordField(),
                            const SizedBox(height: 12),
                            _buildNewPasswordField(),
                            const SizedBox(height: 12),
                            _buildConfirmPasswordField(),
                            const SizedBox(height: 12),
                            const Spacer(),
                            Builder(
                              builder: (context) => _buildSaveButton(
                                context,
                                isLoading: state.status ==
                                    ChangePasswordPageStatus.loading,
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

  Widget _buildOldPasswordField() {
    return FormBuilderTextField(
      name: ChangePasswordPageField.oldPassword.name,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return context.strings.fieldRequired;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.strings.oldPassword,
        prefixIcon: Icon(MdiIcons.key),
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return FormBuilderTextField(
      name: ChangePasswordPageField.newPassword.name,
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
      name: ChangePasswordPageField.confirmPassword.name,
      obscureText: true,
      validator: (value) {
        if (value != _fbValues[ChangePasswordPageField.newPassword.name]) {
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
            context.locator<ChangePasswordPageController>()(
              PatchPassword(
                newPassword:
                    _fbValues[ChangePasswordPageField.newPassword.name],
                oldPassword:
                    _fbValues[ChangePasswordPageField.oldPassword.name],
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
