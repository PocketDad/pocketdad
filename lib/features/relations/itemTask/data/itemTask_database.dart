import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repositories/firestore/firestore_path.dart';
import '../../../../repositories/firestore/firestore_service.dart';
import '../domain/itemTask.dart';

/// Provides access to the Firestore database storing [ItemTask] documents.
class ItemTaskDatabase {
  ItemTaskDatabase(this.ref);

  final ProviderRef<ItemTaskDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<ItemTask>> watchItemTasks() => _service.watchCollection(
      path: FirestorePath.itemTasks(),
      builder: (data, documentId) => ItemTask.fromJson(data!));

  Stream<ItemTask> watchItemTask(String itemTaskId) => _service.watchDocument(
      path: FirestorePath.itemTask(itemTaskId),
      builder: (data, documentId) => ItemTask.fromJson(data!));

  Future<List<ItemTask>> fetchItemTasks() => _service.fetchCollection(
      path: FirestorePath.itemTasks(),
      builder: (data, documentId) => ItemTask.fromJson(data!));

  Future<ItemTask> fetchItemTask(String itemTaskId) => _service.fetchDocument(
      path: FirestorePath.itemTask(itemTaskId),
      builder: (data, documentId) => ItemTask.fromJson(data!));

  Future<void> setItemTaskError(ItemTask itemTask) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());
  
  Future<void> setItemTask(ItemTask itemTask) => _service.setData(
      path: FirestorePath.itemTask(itemTask.id), data: itemTask.toJson());

  Future<void> deleteItemTask(ItemTask itemTask) =>
      _service.deleteData(path: FirestorePath.itemTask(itemTask.id));
}
