import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.locator<TripDetailsPageController>().getDetails(widget.tripId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Add localizations
    return BlocBuilder<TripChatPageCubit, TripChatPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chat'),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          context.locator<TripChatController>().sendMessage(
                                text: _controller.text,
                                chatId: widget.tripId.toString(),
                              );
                          _controller.text = '';
                        }
                      },
                      icon: Icon(MdiIcons.send))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
