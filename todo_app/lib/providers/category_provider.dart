import 'package:todo_app/utils/task_categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>(
  (ref) {
    return TaskCategory.others;
  },
);
