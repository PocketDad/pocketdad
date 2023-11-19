import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/taskUser.dart';
import 'taskUser_database.dart';

part 'taskUser_provider.g.dart';


@riverpod
TaskUserDatabase taskUserDatabase(TaskUserDatabaseRef ref) {
  return TaskUserDatabase(ref);
}

@riverpod
Stream<List<TaskUser>> taskUsers(TaskUsersRef ref) {
  final database = ref.watch(taskUserDatabaseProvider);
  return database.watchTaskUsers();
}

// final itemTaskUserDBProvider = Provider<ItemTaskUserDB>((ref) {
//   return ItemTaskUserDB(ref);
// });