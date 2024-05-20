import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: context.appRouter.pushSignUpPage,
          child: const Text('Sign up'),
        ),
      ),
    );
  }
}
