import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TripChatButton extends StatelessWidget {
  final int tripId;

  const TripChatButton({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: const ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size.fromHeight(48),
        ),
      ),
      onPressed: () {
        //TODO: Navigate to chat
      },
      icon: Icon(MdiIcons.chat),
      //TODO: Add localizations
      label: const Text('Chat'),
    );
  }
}
