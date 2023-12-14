import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repositories/firestore/firestore_path.dart';
import '../../../../repositories/firestore/firestore_service.dart';
import '../domain/userConversation.dart';

/// Provides access to the Firestore database storing [UserConversation] documents.
class UserConversationDatabase {
  UserConversationDatabase(this.ref);

  final ProviderRef<UserConversationDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<UserConversation>> watchUserConversations() => _service.watchCollection(
      path: FirestorePath.userConversations(),
      builder: (data, documentId) => UserConversation.fromJson(data!));

  Stream<UserConversation> watchUserConversation(String userConversationId) => _service.watchDocument(
      path: FirestorePath.userConversation(userConversationId),
      builder: (data, documentId) => UserConversation.fromJson(data!));

  Future<List<UserConversation>> fetchUserConversations() => _service.fetchCollection(
      path: FirestorePath.userConversations(),
      builder: (data, documentId) => UserConversation.fromJson(data!));

  Future<UserConversation> fetchUserConversation(String userConversationId) => _service.fetchDocument(
      path: FirestorePath.userConversation(userConversationId),
      builder: (data, documentId) => UserConversation.fromJson(data!));

  Future<void> setUserConversation(UserConversation userConversation) => _service.setData(
      path: FirestorePath.userConversation(userConversation.id), data: userConversation.toJson());

  Future<void> deleteUserConversation(UserConversation userConversation) =>
      _service.deleteData(path: FirestorePath.userConversation(userConversation.id));
}
