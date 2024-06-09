import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presentation/src/pages/user/tourist_tips_page/tourist_tip.dart';

class TouristTipTile extends StatelessWidget {
  final TouristTip touristTip;

  const TouristTipTile({
    super.key,
    required this.touristTip,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(MdiIcons.lightbulb),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    touristTip.getTitle(context),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 2),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(touristTip.getDescription(context)),
          ),
        ],
      ),
    );
  }
}
