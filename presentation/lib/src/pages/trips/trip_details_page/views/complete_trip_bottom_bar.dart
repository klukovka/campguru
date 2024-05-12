import 'package:flutter/material.dart';

class CompleteTripBottomBar extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const CompleteTripBottomBar({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        color: Theme.of(context).navigationBarTheme.backgroundColor,
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            //TODO: Add localizations
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.all(4),
                    child: CircularProgressIndicator(),
                  )
                : const Text('Complete'),
          ),
        ),
      ),
    );
  }
}
