import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/date_formatter_extension.dart';

import 'message_container.dart';

class ParticipantMessageTile extends StatelessWidget {
  final Message message;
  final bool isLast;

  const ParticipantMessageTile({
    super.key,
    required this.isLast,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 24, 6),
                child: _buildMessage(context),
              ),
              _buildTime(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return MessageContainer(
      background:
          Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
      isLast: isLast,
      side: MessageSide.left,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 24, 16, 28),
        constraints: const BoxConstraints(minWidth: 92),
        child: Text(
          message.text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
    );
  }

  Widget _buildTime(BuildContext context) {
    return Positioned(
      bottom: 12,
      right: 36,
      child: Text(
        message.sentAt.toLocal().messageFormattedTime,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
      ),
    );
  }
}
