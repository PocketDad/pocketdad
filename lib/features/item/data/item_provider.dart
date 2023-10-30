import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/item_db.dart';

final itemDBProvider = Provider<ItemDB>((ref) {
  return ItemDB(ref);
});