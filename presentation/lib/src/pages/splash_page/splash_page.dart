import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

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
  late final Timer _exitTimer;

  @override
  void initState() {
    super.initState();
    _exitTimer = Timer(
      const Duration(seconds: 1),
      () => context.locator<SplashPageController>()
        ..getSettings()
        ..checkIfAuthorized(),
    );
  }

  @override
  void dispose() {
    _exitTimer.cancel();
    super.dispose();
  }

  void _onStateChanged(BuildContext context, SplashPageState state) {
    switch (state) {
      case SplashPageState.authorized:
        context.locator<SplashPageController>().preloadData();
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
      child: Scaffold(
        body: Center(
          child: SpinKitFadingCircle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
