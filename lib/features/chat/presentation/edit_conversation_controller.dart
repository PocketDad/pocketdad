import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/conversation_database.dart';
import '../data/conversation_provider.dart';
import '../domain/conversation.dart';

part 'edit_conversation_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditConversationController extends _$EditConversationController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new conversation or edit an existing one.
  Future<void> updateConversation({
    required Conversation conversation,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ConversationDatabase conversationDatabase = ref.watch(conversationDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => conversationDatabase.setConversation(conversation));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteConversation({
    required Conversation conversation,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ConversationDatabase conversationDatabase = ref.watch(conversationDatabaseProvider);
    final newState =
    await AsyncValue.guard(() => conversationDatabase.deleteConversation(conversation));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
