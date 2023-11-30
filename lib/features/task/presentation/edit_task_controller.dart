import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/task_database.dart';
import '../data/task_provider.dart';
import '../domain/task.dart';

part 'edit_task_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditTaskController extends _$EditTaskController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new task or edit an existing one.
  Future<void> updateTask({
    required Task task,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    TaskDatabase taskDatabase = ref.watch(taskDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => taskDatabase.setTask(task));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteTask({
    required Task task,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    TaskDatabase taskDatabase = ref.watch(taskDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => taskDatabase.deleteTask(task));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
