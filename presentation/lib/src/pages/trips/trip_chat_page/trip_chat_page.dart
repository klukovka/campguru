import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class TripChatPage extends StatefulWidget implements AutoRouteWrapper {
  final int tripId;
  const TripChatPage({
    super.key,
    @PathParam('id') required this.tripId,
  });

  @override
  State<TripChatPage> createState() => _TripChatPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<TripChatPageCubit>(),
      child: this,
    );
  }
}

class _TripChatPageState extends State<TripChatPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<TripDetailsPageController>().getDetails(widget.tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Add localizations
    return Container();
  }
}
