import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/task.dart';
import 'task_database.dart';

part 'task_provider.g.dart';


@riverpod
TaskDatabase taskDatabase(TaskDatabaseRef ref) {
  return TaskDatabase(ref);
}

@riverpod
Stream<List<Task>> tasks(TasksRef ref) {
  final database = ref.watch(taskDatabaseProvider);
  return database.watchTasks();
}

// Old way:
// final taskDBProvider = Provider<TaskDB>((ref) {
//   return TaskDB(ref);
// });