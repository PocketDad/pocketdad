import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/item_task_db.dart';

final itemTaskDBProvider = Provider<ItemTaskDB>((ref) {
  return ItemTaskDB(ref);
});