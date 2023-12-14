import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/conversationMessage_database.dart';
import '../data/conversationMessage_provider.dart';
import '../domain/conversationMessage.dart';

part 'edit_conversationMessage_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditConversationMessageController extends _$EditConversationMessageController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new conversationMessage or edit an existing one.
  Future<void> updateConversationMessage({
    required ConversationMessage conversationMessage,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ConversationMessageDatabase conversationMessageDatabase = ref.watch(conversationMessageDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => conversationMessageDatabase.setConversationMessage(conversationMessage));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteConversationMessage({
    required ConversationMessage conversationMessage,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ConversationMessageDatabase conversationMessageDatabase = ref.watch(conversationMessageDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => conversationMessageDatabase.deleteConversationMessage(conversationMessage));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
