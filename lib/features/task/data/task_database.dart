import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/task.dart';

/// Provides access to the Firestore database storing [Task] documents.
class TaskDatabase {
  TaskDatabase(this.ref);

  final ProviderRef<TaskDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Task>> watchTasks() => _service.watchCollection(
      path: FirestorePath.tasks(),
      builder: (data, documentId) => Task.fromJson(data!));

  Stream<Task> watchTask(String taskId) => _service.watchDocument(
      path: FirestorePath.task(taskId),
      builder: (data, documentId) => Task.fromJson(data!));

  Future<List<Task>> fetchTasks() => _service.fetchCollection(
      path: FirestorePath.tasks(),
      builder: (data, documentId) => Task.fromJson(data!));

  Future<Task> fetchTask(String taskId) => _service.fetchDocument(
      path: FirestorePath.task(taskId),
      builder: (data, documentId) => Task.fromJson(data!));

  Future<void> setTask(Task task) => _service.setData(
      path: FirestorePath.task(task.id), data: task.toJson());

  Future<void> setTaskDelayed(Task task) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.task(task.id), data: task.toJson()));

  Future<void> setTaskError(Task task) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteTask(Task task) =>
      _service.deleteData(path: FirestorePath.task(task.id));
}
