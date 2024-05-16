import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateRoutePage extends StatefulWidget {
  const CreateRoutePage({super.key});

  @override
  State<CreateRoutePage> createState() => _CreateRoutePageState();
}

class _CreateRoutePageState extends State<CreateRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add localization
      appBar: AppBar(title: const Text('Create Route')),
    );
  }
}
