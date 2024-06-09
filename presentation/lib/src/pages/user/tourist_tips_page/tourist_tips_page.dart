import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/pages/user/tourist_tips_page/tourist_tip.dart';
import 'package:presentation/src/pages/user/tourist_tips_page/views/tourist_tip_tile.dart';

@RoutePage()
class TouristTipsPage extends StatelessWidget {
  const TouristTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.touristTips),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 28, right: 28),
            child: Row(
              children: [
                Icon(MdiIcons.campfire),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    context.strings.theseTipsHelpYou,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) =>
                  TouristTipTile(touristTip: TouristTip.values[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: TouristTip.values.length,
            ),
          ),
        ],
      ),
    );
  }
}
