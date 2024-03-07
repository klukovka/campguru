import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';

@RoutePage()
class SplashPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<SplashPageCubit>(),
      child: this,
    );
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      if (mounted) {
        context.locator<SplashPageController>()();
      }
    });
  }

  void _onStateChanged(BuildContext context, SplashPageState state) {
    switch (state) {
      case SplashPageState.authorized:
        context.appRouter.replaceToHomePage();
        break;
      case SplashPageState.nonAuthorized:
        context.appRouter.replaceToStartPage();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashPageCubit, SplashPageState>(
      listener: _onStateChanged,
      child: const Scaffold(
        body: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
