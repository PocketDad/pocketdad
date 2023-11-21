import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pocketdad/features/chat/presentation/chat.dart';
import 'package:pocketdad/features/chat/presentation/chat_bubble.dart';

class ChatNotifier extends StateNotifier<List<ChatBubble>> {
  ChatNotifier() : super([]);

  void addMessage(String message, bool isMe) {
    state = [...state, ChatBubble(message: message, isMe: isMe)];
  }

  final chatProvider = StateNotifierProvider((ref) {
    return ChatNotifier();
  });
}