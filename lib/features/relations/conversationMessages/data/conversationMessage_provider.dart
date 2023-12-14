import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/conversationMessage.dart';
import 'conversationMessage_database.dart';

part 'conversationMessage_provider.g.dart';


@riverpod
ConversationMessageDatabase conversationMessageDatabase(ConversationMessageDatabaseRef ref) {
  return ConversationMessageDatabase(ref);
}

@riverpod
Stream<List<ConversationMessage>> conversationMessages(ConversationMessagesRef ref) {
  final database = ref.watch(conversationMessageDatabaseProvider);
  return database.watchConversationMessages();
}
