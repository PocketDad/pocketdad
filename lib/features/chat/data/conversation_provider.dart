import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/conversation.dart';
import 'conversation_database.dart';

part 'conversation_provider.g.dart';


@riverpod
ConversationDatabase conversationDatabase(ConversationDatabaseRef ref) {
  return ConversationDatabase(ref);
}

@riverpod
Stream<List<Conversation>> conversations(ConversationsRef ref) {
  final database = ref.watch(conversationDatabaseProvider);
  return database.watchConversations();
}