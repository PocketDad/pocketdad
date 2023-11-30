import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/task_database.dart';
import '../data/task_provider.dart';
import '../domain/task.dart';

part 'task_controller.g.dart';

// The design of this controller is modeled on:
// Prof Johnson's AGC phase 5
// Hi professor!
@riverpod
class TaskController extends _$TaskController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

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
    if(!state.hasError) {
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
    if(!state.hasError) {
      onSuccess();
    }
  }
}