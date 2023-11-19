import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/item.dart';

/// Provides access to the Firestore database storing [Item] documents.
class ItemDatabase {
  ItemDatabase(this.ref);

  final ProviderRef<ItemDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Item>> watchItems() => _service.watchCollection(
      path: FirestorePath.items(),
      builder: (data, documentId) => Item.fromJson(data!));

  Stream<Item> watchItem(String itemId) => _service.watchDocument(
      path: FirestorePath.item(itemId),
      builder: (data, documentId) => Item.fromJson(data!));

  Future<List<Item>> fetchItems() => _service.fetchCollection(
      path: FirestorePath.items(),
      builder: (data, documentId) => Item.fromJson(data!));

  Future<Item> fetchItem(String itemId) => _service.fetchDocument(
      path: FirestorePath.item(itemId),
      builder: (data, documentId) => Item.fromJson(data!));

  Future<void> setItem(Item item) => _service.setData(
      path: FirestorePath.item(item.id), data: item.toJson());

  Future<void> setItemDelayed(Item item) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.item(item.id), data: item.toJson()));

  Future<void> setItemError(Item item) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteItem(Item item) =>
      _service.deleteData(path: FirestorePath.item(item.id));
}
