import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  static Future<void> showDeleteAlertDialog(
      BuildContext context, WidgetRef ref, Task task) async {
    Widget cancelButton =
        TextButton(onPressed: () => context.pop(), child: const Text('NO'));
    Widget deleteButton = TextButton(
        onPressed: () async {
          await ref.read(taskProvider.notifier).deleteTask(task).then((value) =>
              {
                displaySnackBar(context, 'Task successfully deleted'),
                context.pop()
              });
        },
        child: const Text('DELETE'));
    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this task?'),
      actions: [deleteButton, cancelButton],
    );

    await showDialog(
        context: context,
        builder: (ctx) {
          return alert;
        });
  }
}
