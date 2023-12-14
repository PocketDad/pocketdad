import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/message_database.dart';
import '../data/message_provider.dart';
import '../domain/message.dart';

part 'edit_message_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditMessageController extends _$EditMessageController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new message or edit an existing one.
  Future<void> updateMessage({
    required Message message,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    MessageDatabase messageDatabase = ref.watch(messageDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => messageDatabase.setMessage(message));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteMessage({
    required Message message,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    MessageDatabase messageDatabase = ref.watch(messageDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => messageDatabase.deleteMessage(message));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
