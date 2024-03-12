import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/core/extensions/build_context_extension.dart';

@RoutePage()
class LocationDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final int locationId;

  const LocationDetailsPage({
    super.key,
    @PathParam('id') required this.locationId,
  });

  @override
  State<LocationDetailsPage> createState() => _LocationDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<LocationDetailsPageCubit>(),
      child: this,
    );
  }
}

class _LocationDetailsPageState extends State<LocationDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<LocationDetailsPageController>()(widget.locationId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationDetailsPageCubit, LocationDetailsPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: ArrowButton.back(onPressed: context.appRouter.pop),
          ),
          body: const CustomScrollView(),
        );
      },
    );
  }
}
