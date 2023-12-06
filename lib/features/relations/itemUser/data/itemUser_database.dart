import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repositories/firestore/firestore_path.dart';
import '../../../../repositories/firestore/firestore_service.dart';
import '../domain/itemUser.dart';

/// Provides access to the Firestore database storing [ItemUser] documents.
class ItemUserDatabase {
  ItemUserDatabase(this.ref);

  final ProviderRef<ItemUserDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<ItemUser>> watchItemUsers() => _service.watchCollection(
      path: FirestorePath.itemUsers(),
      builder: (data, documentId) => ItemUser.fromJson(data!));

  Stream<ItemUser> watchItemUser(String itemUserId) => _service.watchDocument(
      path: FirestorePath.itemUser(itemUserId),
      builder: (data, documentId) => ItemUser.fromJson(data!));

  Future<List<ItemUser>> fetchItemUsers() => _service.fetchCollection(
      path: FirestorePath.itemUsers(),
      builder: (data, documentId) => ItemUser.fromJson(data!));

  Future<ItemUser> fetchItemUser(String itemUserId) => _service.fetchDocument(
      path: FirestorePath.itemUser(itemUserId),
      builder: (data, documentId) => ItemUser.fromJson(data!));

  Future<void> setItemUser(ItemUser itemUser) => _service.setData(
      path: FirestorePath.itemUser(itemUser.id), data: itemUser.toJson());

  Future<void> deleteItemUser(ItemUser itemUser) =>
      _service.deleteData(path: FirestorePath.itemUser(itemUser.id));
}
