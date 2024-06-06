import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localizations/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/auth/start_page/views/auth_buttons.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum StartPageField {
  email,
  password,
}

@RoutePage()
class StartPage extends StatefulWidget implements AutoRouteWrapper {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<StartPageCubit>(),
      child: this,
    );
  }
}

class _StartPageState extends State<StartPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartPageCubit, StartPageState>(
      listener: (context, state) {
        if (state.status == StartPageStatus.success) {
          context.appRouter.replaceToSplashPage();
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                              context.strings.appName,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const Spacer(),
                            _buildEmailField(),
                            const SizedBox(height: 12),
                            _buildPasswordField(),
                            const SizedBox(height: 12),
                            Builder(
                              builder: (context) => _buildSaveButton(
                                context,
                                isLoading:
                                    state.status == StartPageStatus.loading,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Spacer(),
                            const AuthButtons(),
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
      name: StartPageField.email.name,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return context.strings.emailAddressRequired;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.strings.email,
        prefixIcon: Icon(MdiIcons.email),
      ),
    );
  }

  Widget _buildPasswordField() {
    return FormBuilderTextField(
      name: StartPageField.password.name,
      onChanged: (value) => _fbState?.save(),
      obscureText: true,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return context.strings.passwordRequired;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: context.strings.password,
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
            context.locator<StartPageController>()(
              LoginUser(
                email: _fbValues[StartPageField.email.name],
                password: _fbValues[StartPageField.password.name],
              ),
            );
          }
        },
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : Text(context.strings.login),
      ),
    );
  }
}
