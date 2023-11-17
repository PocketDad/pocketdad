import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/item.dart';
import 'item_database.dart';

part 'item_provider.g.dart';


@riverpod
ItemDatabase itemDatabase(ItemDatabaseRef ref) {
  return ItemDatabase(ref);
}

@riverpod
Stream<List<Item>> items(ItemsRef ref) {
  final database = ref.watch(itemDatabaseProvider);
  return database.watchItems();
}

// Old way:
// final itemDBProvider = Provider<ItemDB>((ref) {
//   return ItemDB(ref);
// });

// final itemDBProvider = Provider<ItemDB>((ref) {
//   return ItemDB(ref);
// });