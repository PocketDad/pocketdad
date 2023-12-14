import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/userConversation.dart';
import 'userConversation_database.dart';

part 'userConversation_provider.g.dart';


@riverpod
UserConversationDatabase userConversationDatabase(UserConversationDatabaseRef ref) {
  return UserConversationDatabase(ref);
}

@riverpod
Stream<List<UserConversation>> userConversations(UserConversationsRef ref) {
  final database = ref.watch(userConversationDatabaseProvider);
  return database.watchUserConversations();
}
