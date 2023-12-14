import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/userConversation_database.dart';
import '../data/userConversation_provider.dart';
import '../domain/userConversation.dart';

part 'edit_userConversation_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditUserConversationController extends _$EditUserConversationController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new userConversation or edit an existing one.
  Future<void> updateUserConversation({
    required UserConversation userConversation,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    UserConversationDatabase userConversationDatabase = ref.watch(userConversationDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => userConversationDatabase.setUserConversation(userConversation));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteUserConversation({
    required UserConversation userConversation,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    UserConversationDatabase userConversationDatabase = ref.watch(userConversationDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => userConversationDatabase.deleteUserConversation(userConversation));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
