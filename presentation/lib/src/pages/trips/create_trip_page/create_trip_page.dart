import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/trips/create_trip_page/views/trip_route_view.dart';
import 'package:presentation/src/pages/trips/create_trip_page/views/trip_user_chip.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum CreateTripPageField {
  users,
  route,
  title,
  date,
}

@RoutePage()
class CreateTripPage extends StatefulWidget implements AutoRouteWrapper {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<CreateTripPageCubit>(),
      child: this,
    );
  }
}

class _CreateTripPageState extends State<CreateTripPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  late final TextEditingController _textEditingController;

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  CreateTripPageController get _controller =>
      context.locator<CreateTripPageController>();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTripPageCubit, CreateTripPageState>(
      listener: (context, state) {
        _fbState?.patchValue({
          CreateTripPageField.route.name: state.route,
          CreateTripPageField.users.name: state.users.toList(),
        });
        _fbState?.save();
        if (!state.isLoading && state.trip != null) {
          context.appRouter.replaceTripDetailsPage(state.trip!.id);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.strings.createTrip),
          ),
          body: AutovalidateModeNotificationBuilder(
            builder: (context, autovalidateMode, child) => FormBuilder(
              key: _fbKey,
              autovalidateMode: autovalidateMode,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.strings.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          _buildTitleField(),
                          const SizedBox(height: 12),
                          Text(
                            context.strings.users,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          _buildSearchUsersField(),
                          const SizedBox(height: 8),
                          _buildUsersField(),
                          const SizedBox(height: 12),
                          Text(
                            context.strings.route,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          _buildRouteField(),
                          const SizedBox(height: 12),
                          Text(
                            context.strings.date,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          _buildDateField(),
                          const SizedBox(height: 12),
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

  Widget _buildTitleField() {
    return FormBuilderTextField(
      name: CreateTripPageField.title.name,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return context.strings.titleRequired;
        }
        return null;
      },
    );
  }

  Widget _buildSearchUsersField() {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: context.strings.enterUserEmail,
      ),
      onSubmitted: (value) {
        _controller.getUserByEmail(value);
        _textEditingController.text = '';
      },
    );
  }

  Widget _buildUsersField() {
    return FormBuilderField<List<User>?>(
        name: CreateTripPageField.users.name,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return context.strings.selectAtLeastOneUser;
          }
          return null;
        },
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: state.value
                        ?.map((user) => TripUserChip(user: user))
                        .toList() ??
                    [],
              ),
              if (state.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 8),
                  child: Text(
                    state.errorText ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ),
            ],
          );
        });
  }

  Widget _buildRouteField() {
    return FormBuilderField<Route?>(
      name: CreateTripPageField.route.name,
      validator: (value) {
        if (value == null) {
          return context.strings.routeRequired;
        }
        return null;
      },
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripRouteView(route: state.value),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child: Text(
                  state.errorText ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildDateField() {
    return FormBuilderDateTimePicker(
      name: CreateTripPageField.date.name,
      validator: (value) {
        if (value == null) {
          return context.strings.dateRequired;
        }
        return null;
      },
    );
  }

  Widget _buildSaveButton(
    BuildContext context,
    CreateTripPageState state,
  ) {
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
            final newTrip = NewTrip(
              users: _fbValues[CreateTripPageField.users.name],
              route: _fbValues[CreateTripPageField.route.name],
              date: _fbValues[CreateTripPageField.date.name],
              title: _fbValues[CreateTripPageField.title.name],
            );
            _controller.createTrip(newTrip);
          }
        },
        child: state.isLoading
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : Text(context.strings.save),
      ),
    );
  }
}
