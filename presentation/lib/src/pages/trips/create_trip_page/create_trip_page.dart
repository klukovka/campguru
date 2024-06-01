import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/trips/create_trip_page/views/trip_route_view.dart';
import 'package:presentation/src/pages/trips/create_trip_page/views/trip_user_chip.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

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
  late final TextEditingController _textEditingController;
  DateTime _selectedDate = DateTime.now();

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
    //TODO: Add localizations
    return BlocBuilder<CreateTripPageCubit, CreateTripPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create Trip'),
          ),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Users',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Enter user\'s email',
                        ),
                        onSubmitted: (value) {
                          _controller.getUserByEmail(value);
                          _textEditingController.text = '';
                        },
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: state.users
                            .map((user) => TripUserChip(user: user))
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Route',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      TripRouteView(route: state.route),
                      const SizedBox(height: 12),
                      Text(
                        'Date',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        onDateChanged: (date) => _selectedDate = date,
                      ),
                      const SizedBox(height: 12),
                      const Spacer(),
                      _buildSaveButton(state),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSaveButton(
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
          if (state.users.isEmpty || state.route == null) {
            const title = 'Trip Creation Error!';
            final message = [
              if (state.users.isEmpty) 'Select at least 1 user.',
              if (state.route == null) 'Route is required.'
            ].join('\n');
            context.appRouter.pushErrorDialog(
              title: title,
              message: message,
            );
            return;
          }
        },
        child: state.isLoading
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : const Text('Save'),
      ),
    );
  }
}
