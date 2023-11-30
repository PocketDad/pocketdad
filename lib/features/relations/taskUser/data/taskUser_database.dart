import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repositories/firestore/firestore_path.dart';
import '../../../../repositories/firestore/firestore_service.dart';
import '../domain/taskUser.dart';

/// Provides access to the Firestore database storing [TaskUser] documents.
class TaskUserDatabase {
  TaskUserDatabase(this.ref);

  final ProviderRef<TaskUserDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<TaskUser>> watchTaskUsers() => _service.watchCollection(
      path: FirestorePath.taskUsers(),
      builder: (data, documentId) => TaskUser.fromJson(data!));

  Stream<TaskUser> watchTaskUser(String taskUserId) => _service.watchDocument(
      path: FirestorePath.taskUser(taskUserId),
      builder: (data, documentId) => TaskUser.fromJson(data!));

  Future<List<TaskUser>> fetchTaskUsers() => _service.fetchCollection(
      path: FirestorePath.taskUsers(),
      builder: (data, documentId) => TaskUser.fromJson(data!));

  Future<TaskUser> fetchTaskUser(String taskUserId) => _service.fetchDocument(
      path: FirestorePath.taskUser(taskUserId),
      builder: (data, documentId) => TaskUser.fromJson(data!));

  Future<void> setTaskUser(TaskUser taskUser) => _service.setData(
      path: FirestorePath.taskUser(taskUser.id), data: taskUser.toJson());

  Future<void> deleteTaskUser(TaskUser taskUser) =>
      _service.deleteData(path: FirestorePath.taskUser(taskUser.id));
}
