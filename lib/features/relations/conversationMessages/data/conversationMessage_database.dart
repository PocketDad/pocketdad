import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repositories/firestore/firestore_path.dart';
import '../../../../repositories/firestore/firestore_service.dart';
import '../domain/conversationMessage.dart';

/// Provides access to the Firestore database storing [ConversationMessage] documents.
class ConversationMessageDatabase {
  ConversationMessageDatabase(this.ref);

  final ProviderRef<ConversationMessageDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<ConversationMessage>> watchConversationMessages() => _service.watchCollection(
      path: FirestorePath.conversationMessages(),
      builder: (data, documentId) => ConversationMessage.fromJson(data!));

  Stream<ConversationMessage> watchConversationMessage(String conversationMessageId) => _service.watchDocument(
      path: FirestorePath.conversationMessage(conversationMessageId),
      builder: (data, documentId) => ConversationMessage.fromJson(data!));

  Future<List<ConversationMessage>> fetchConversationMessages() => _service.fetchCollection(
      path: FirestorePath.conversationMessages(),
      builder: (data, documentId) => ConversationMessage.fromJson(data!));

  Future<ConversationMessage> fetchConversationMessage(String conversationMessageId) => _service.fetchDocument(
      path: FirestorePath.conversationMessage(conversationMessageId),
      builder: (data, documentId) => ConversationMessage.fromJson(data!));

  Future<void> setConversationMessage(ConversationMessage conversationMessage) => _service.setData(
      path: FirestorePath.conversationMessage(conversationMessage.id), data: conversationMessage.toJson());

  Future<void> deleteConversationMessage(ConversationMessage conversationMessage) =>
      _service.deleteData(path: FirestorePath.conversationMessage(conversationMessage.id));
}
