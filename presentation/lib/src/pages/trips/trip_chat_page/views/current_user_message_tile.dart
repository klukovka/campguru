import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/date_formatter_extension.dart';

import 'message_container.dart';

class CurrentUserMessageTile extends StatelessWidget {
  final Message message;
  final bool isLast;
  final User? user;

  const CurrentUserMessageTile({
    super.key,
    required this.isLast,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 6, 0, 6),
            child: _buildMessage(context),
          ),
          _buildTime(context),
        ],
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return MessageContainer(
      background: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      isLast: isLast,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        constraints: const BoxConstraints(minWidth: 92),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.fullname ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(message.text),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTime(BuildContext context) {
    return Positioned(
      bottom: 12,
      right: 12,
      child: Text(
        message.sentAt.toLocal().messageFormattedTime,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
