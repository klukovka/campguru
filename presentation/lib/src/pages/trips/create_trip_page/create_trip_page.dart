import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
