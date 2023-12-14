import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/conversation.dart';

/// Provides access to the Firestore database storing [Conversation] documents.
class ConversationDatabase {
  ConversationDatabase(this.ref);

  final ProviderRef<ConversationDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Conversation>> watchConversations() => _service.watchCollection(
      path: FirestorePath.conversations(),
      builder: (data, documentId) => Conversation.fromJson(data!));

  Stream<Conversation> watchConversation(String conversationId) => _service.watchDocument(
      path: FirestorePath.conversation(conversationId),
      builder: (data, documentId) => Conversation.fromJson(data!));

  Future<List<Conversation>> fetchConversations() => _service.fetchCollection(
      path: FirestorePath.conversations(),
      builder: (data, documentId) => Conversation.fromJson(data!));

  Future<Conversation> fetchConversation(String conversationId) => _service.fetchDocument(
      path: FirestorePath.conversation(conversationId),
      builder: (data, documentId) => Conversation.fromJson(data!));

  Future<void> setConversation(Conversation conversation) => _service.setData(
      path: FirestorePath.conversation(conversation.id), data: conversation.toJson());

  Future<void> setConversationDelayed(Conversation conversation) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.conversation(conversation.id), data: conversation.toJson()));

  Future<void> setConversationError(Conversation conversation) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteConversation(Conversation conversation) =>
      _service.deleteData(path: FirestorePath.conversation(conversation.id));
}
