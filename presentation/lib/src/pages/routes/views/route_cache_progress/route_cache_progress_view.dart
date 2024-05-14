import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class RouteCacheProgressView extends StatelessWidget {
  const RouteCacheProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<RouteCacheProgressViewCubit>(),
      child:
          BlocBuilder<RouteCacheProgressViewCubit, RouteCacheProgressViewState>(
        builder: (context, state) {
          return CacheProgressView(progress: state.cacheProgress);
        },
      ),
    );
  }
}
