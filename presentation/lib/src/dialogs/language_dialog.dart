import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

@RoutePage()
class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<ProfileTabController>();
    return BlocBuilder<AppControlCubit, AppControlState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingsTile(
                isActive: state.currentLocale.languageCode == 'uk',
                onTap: () => controller.setLocale('uk'),
                title: context.strings.ukrainian,
              ),
              SettingsTile(
                isActive: state.currentLocale.languageCode == 'en',
                onTap: () => controller.setLocale('en'),
                title: context.strings.english,
              ),
            ],
          ),
        );
      },
    );
  }
}
