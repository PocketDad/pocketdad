import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/itemUser.dart';
import 'itemUser_database.dart';

part 'itemUser_provider.g.dart';


@riverpod
ItemUserDatabase itemUserDatabase(ItemUserDatabaseRef ref) {
  return ItemUserDatabase(ref);
}

@riverpod
Stream<List<ItemUser>> itemUsers(ItemUsersRef ref) {
  final database = ref.watch(itemUserDatabaseProvider);
  return database.watchItemUsers();
}

// final itemItemUserDBProvider = Provider<ItemItemUserDB>((ref) {
//   return ItemItemUserDB(ref);
// });