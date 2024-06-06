import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                //TODO: Add forgot password
              },
              child: Text(context.strings.forgotPassword),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, right: 10),
                child: Text(
                  context.strings.dontHaveAccount,
                  textAlign: TextAlign.end,
                ),
              ),
              TextButton(
                onPressed: context.appRouter.pushSignUpPage,
                child: Text(context.strings.registerNow),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
