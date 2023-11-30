import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/taskUser_database.dart';
import '../data/taskUser_provider.dart';
import '../domain/taskUser.dart';

part 'edit_taskUser_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditTaskUserController extends _$EditTaskUserController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new taskUser or edit an existing one.
  Future<void> updateTaskUser({
    required TaskUser taskUser,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    TaskUserDatabase taskUserDatabase = ref.watch(taskUserDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => taskUserDatabase.setTaskUser(taskUser));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteTaskUser({
    required TaskUser taskUser,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    TaskUserDatabase taskUserDatabase = ref.watch(taskUserDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => taskUserDatabase.deleteTaskUser(taskUser));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
