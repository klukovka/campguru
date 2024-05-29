import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateTripPage extends StatefulWidget {
  const CreateTripPage({super.key});

  @override
  State<CreateTripPage> createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  @override
  Widget build(BuildContext context) {
    //TODO: Add localizations
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Trip'),
      ),
    );
  }
}
