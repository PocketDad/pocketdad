import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/itemTask_database.dart';
import '../data/itemTask_provider.dart';
import '../domain/itemTask.dart';

part 'edit_itemTask_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditItemTaskController extends _$EditItemTaskController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new itemTask or edit an existing one.
  Future<void> updateItemTask({
    required ItemTask itemTask,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ItemTaskDatabase itemTaskDatabase = ref.watch(itemTaskDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => itemTaskDatabase.setItemTask(itemTask));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteItemTask({
    required ItemTask itemTask,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ItemTaskDatabase itemTaskDatabase = ref.watch(itemTaskDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => itemTaskDatabase.deleteItemTask(itemTask));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
