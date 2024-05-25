import 'package:flutter/material.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Add localizations
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
              child: const Text('Forgot password?'),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 14, right: 10),
                child: Text('Don\'t have an account yet?'),
              ),
              TextButton(
                onPressed: context.appRouter.pushSignUpPage,
                child: const Text('Register now!'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
