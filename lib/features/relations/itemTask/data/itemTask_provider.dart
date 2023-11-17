import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/itemTask.dart';
import 'itemTask_database.dart';

part 'itemTask_provider.g.dart';


@riverpod
ItemTaskDatabase itemTaskDatabase(ItemTaskDatabaseRef ref) {
  return ItemTaskDatabase(ref);
}

@riverpod
Stream<List<ItemTask>> itemTasks(ItemTasksRef ref) {
  final database = ref.watch(itemTaskDatabaseProvider);
  return database.watchItemTasks();
}

// final itemItemTaskDBProvider = Provider<ItemItemTaskDB>((ref) {
//   return ItemItemTaskDB(ref);
// });