import 'package:flutter/material.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../core/extensions/context_extension.dart';

void showUsersErrorDialog({
  required BuildContext context,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Error',
          style: TextStyles.bold16W700(context).copyWith(
            color: context.colorScheme.error,
          ),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
