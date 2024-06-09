import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
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
      body: ListView.separated(
        itemBuilder: (context, index) =>
            TouristTipTile(touristTip: TouristTip.values[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: TouristTip.values.length,
      ),
    );
  }
}
