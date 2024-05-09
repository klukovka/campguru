import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  final VoidCallback onResetPressed;
  final VoidCallback onApplyPressed;
  final bool isLoading;

  const FilterButtons({
    super.key,
    required this.onResetPressed,
    required this.onApplyPressed,
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
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: onResetPressed,
                //TODO: Add localizations
                child: const Text('Reset'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: isLoading ? null : onApplyPressed,
                //TODO: Add localizations
                child: isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(4),
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
