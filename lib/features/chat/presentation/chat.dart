import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/chat/presentation/chat_bubble.dart';
import 'package:http/http.dart' as http;

class Chat extends ConsumerWidget {
  Chat({super.key});
  final chatProvider = Provider<List<ChatBubble>>((ref) {
    return [];
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: const Text("Chat with Dad"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
                builder: (context, watch, child) {
                  final chatList = ref.watch(chatProvider);
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: chatList[index],
                      );
                    },
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ask me anything!',
              ),
              onSubmitted: (String value) {
                ref.watch(chatProvider).add(ChatBubble(message: value, isMe: true));
                ref.watch(chatProvider).add(ChatBubble(message: "Hi! This feature is not yet implemented.", isMe: false));
              },
            ),
          )
        ],
      ),
    );
  }

  completionFunction() async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['OPENAI_KEY']}'
      },
      body: jsonEncode(
        {
          "model": "text-davinci-003",
          "prompt": "this is a test prompt",
          "max_tokens": 250,
          "temperature": 0,
          "top_p": 1,
        }
      )
    );
  }
}
