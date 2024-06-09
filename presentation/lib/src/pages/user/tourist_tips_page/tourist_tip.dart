import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

enum TouristTip {
  adequatePreparation,
  choosingCampsite,
  drinkingWaterAndFood,
  safetyAndOrientation,
  campfireManagement,
  respectNature,
  sunscreenAndInsectRepellent,
  firstAidKit,
  lightingAndPowerSources,
  firstAidKnowledge;

  String getTitle(BuildContext context) => switch (this) {
        TouristTip.adequatePreparation => context.strings.adequatePreparation,
        TouristTip.choosingCampsite => context.strings.choosingCampsite,
        TouristTip.drinkingWaterAndFood => context.strings.drinkingWaterAndFood,
        TouristTip.safetyAndOrientation => context.strings.safetyAndOrientation,
        TouristTip.campfireManagement => context.strings.campfireManagement,
        TouristTip.respectNature => context.strings.respectNature,
        TouristTip.sunscreenAndInsectRepellent =>
          context.strings.sunscreenAndInsectRepellent,
        TouristTip.firstAidKit => context.strings.firstAidKit,
        TouristTip.lightingAndPowerSources =>
          context.strings.lightingAndPowerSources,
        TouristTip.firstAidKnowledge => context.strings.firstAidKnowledge,
      };

  String getDescription(BuildContext context) => switch (this) {
        TouristTip.adequatePreparation =>
          context.strings.adequatePreparationDescription,
        TouristTip.choosingCampsite =>
          context.strings.choosingCampsiteDescription,
        TouristTip.drinkingWaterAndFood =>
          context.strings.drinkingWaterAndFoodDescription,
        TouristTip.safetyAndOrientation =>
          context.strings.safetyAndOrientationDescription,
        TouristTip.campfireManagement =>
          context.strings.campfireManagementDescription,
        TouristTip.respectNature => context.strings.respectNatureDescription,
        TouristTip.sunscreenAndInsectRepellent =>
          context.strings.sunscreenAndInsectRepellentDescription,
        TouristTip.firstAidKit => context.strings.firstAidKitDescription,
        TouristTip.lightingAndPowerSources =>
          context.strings.lightingAndPowerSourcesDescription,
        TouristTip.firstAidKnowledge =>
          context.strings.firstAidKnowledgeDescription,
      };
}
