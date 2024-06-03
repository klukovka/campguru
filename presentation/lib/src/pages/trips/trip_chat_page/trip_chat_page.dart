import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/trips/trip_chat_page/views/current_user_message_tile.dart';
import 'package:presentation/src/pages/trips/trip_chat_page/views/participant_message_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/date_formatter_extension.dart';

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
      context.locator<TripChatController>().init(widget.tripId.toString());
      context.locator<TripDetailsPageController>().getDetails(widget.tripId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DateTime _getMessageDateTime(Message message) {
    return DateTime(
      message.sentAt.year,
      message.sentAt.month,
      message.sentAt.day,
    );
  }

  int _getMessagesComparator(Message current, Message next) {
    return current.comparator(next);
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
          body: _buildMessagesList(state),
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
                              users: state.trip?.users,
                            );
                        _controller.text = '';
                      }
                    },
                    icon: Icon(MdiIcons.send),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessagesList(TripChatPageState state) {
    return GroupedListView<Message, DateTime>(
      elements: state.messages,
      reverse: false,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      order: GroupedListOrder.ASC,
      floatingHeader: true,
      useStickyGroupSeparators: true,
      shrinkWrap: true,
      groupBy: _getMessageDateTime,
      itemComparator: _getMessagesComparator,
      groupComparator: (first, last) => first.compareTo(last),
      groupHeaderBuilder: _buildGroupHeader,
      itemBuilder: (_, message) => _buildMessage(state, message),
    );
  }

  Widget _buildGroupHeader(Message message) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message.sentAt.toLocal().getChatPinnedDate(context),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(TripChatPageState state, Message message) {
    if (message.isCurrentUser(state.currentUserId)) {
      return CurrentUserMessageTile(
        isLast: message.isLastInGroup(state.messages),
        message: message,
      );
    }
    return ParticipantMessageTile(
      isLast: message.isLastInGroup(state.messages),
      message: message,
    );
  }
}
