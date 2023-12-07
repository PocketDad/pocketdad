import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/itemUser_database.dart';
import '../data/itemUser_provider.dart';
import '../domain/itemUser.dart';

part 'edit_itemUser_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditItemUserController extends _$EditItemUserController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new itemUser or edit an existing one.
  Future<void> updateItemUser({
    required ItemUser itemUser,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ItemUserDatabase itemUserDatabase = ref.watch(itemUserDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => itemUserDatabase.setItemUser(itemUser));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteItemUser({
    required ItemUser itemUser,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ItemUserDatabase itemUserDatabase = ref.watch(itemUserDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => itemUserDatabase.deleteItemUser(itemUser));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
