import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

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
      onPressed: () => context.appRouter.pushTripChatPage(tripId),
      icon: Icon(MdiIcons.chat),
      label: Text(context.strings.chat),
    );
  }
}
