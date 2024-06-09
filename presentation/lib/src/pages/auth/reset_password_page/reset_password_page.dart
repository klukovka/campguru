import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localizations/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/credentials_validation_extension.dart';

enum ResetPasswordPageField {
  email,
}

@RoutePage()
class ResetPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<ResetPasswordPageCubit>(),
      child: this,
    );
  }
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordPageCubit, ResetPasswordPageState>(
      listener: (context, state) {
        if (state.status == ResetPasswordPageStatus.success) {
          context
            ..toasts.showSuccess(
              message: context.strings.temporaryPasswordWasSentToEmail(
                _fbValues[ResetPasswordPageField.email.name] ?? '',
              ),
            )
            ..appRouter.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.strings.resetPassword),
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
                            Text(
                              context.strings
                                  .enterYourEmailToReceiveTemporaryPassword,
                            ),
                            const SizedBox(height: 12),
                            _buildEmailField(),
                            const SizedBox(height: 12),
                            const Spacer(),
                            Builder(
                              builder: (context) => _buildSaveButton(
                                context,
                                isLoading: state.status ==
                                    ResetPasswordPageStatus.loading,
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

  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: ResetPasswordPageField.email.name,
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
            context.locator<ResetPasswordPageController>()(
              _fbValues[ResetPasswordPageField.email.name],
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
