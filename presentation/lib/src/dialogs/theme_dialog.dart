import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';
import 'package:presentation/src/utils/extensions/theme_mode_extension.dart';

@RoutePage()
class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.locator<ProfileTabController>();

    return BlocBuilder<AppControlCubit, AppControlState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.map((theme) {
              return SettingsTile(
                isActive: state.theme == theme,
                title: theme.getTitle(context),
                onTap: () => controller.setAppTheme(theme),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
