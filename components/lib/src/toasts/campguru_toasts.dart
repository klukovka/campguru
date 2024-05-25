import 'package:flutter/material.dart';

class CampguruToasts {
  final BuildContext context;

  CampguruToasts.of(this.context);

  SnackBar _buildSnackBar({
    required String message,
    TextAlign textAlign = TextAlign.center,
    Widget? icon,
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      action: action,
      dismissDirection: DismissDirection.endToStart,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          if (icon != null) ...[
            icon,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              textAlign: textAlign,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  void showSuccessCopy(
    String message,
  ) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.copy,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      message: message,
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<SnackBarClosedReason> showAction({
    required String message,
    required SnackBarAction action,
    Widget? icon,
  }) async {
    final snackBar = _buildSnackBar(
      icon: icon,
      message: message,
      action: action,
      backgroundColor: Theme.of(context).colorScheme.background,
      textColor: Theme.of(context).colorScheme.onBackground,
      textAlign: TextAlign.start,
    );
    return await ScaffoldMessenger.of(context).showSnackBar(snackBar).closed;
  }

  void showSuccess({
    required String message,
  }) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.check_circle_rounded,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      message: message,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Theme.of(context).colorScheme.onPrimary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showWarning(String message) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.warning,
        color: Theme.of(context).colorScheme.secondary,
      ),
      message: message,
      textColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showError(String message) {
    final snackBar = _buildSnackBar(
      icon: Icon(
        Icons.error_outline,
        color: Theme.of(context).colorScheme.onError,
      ),
      message: message,
      textColor: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
