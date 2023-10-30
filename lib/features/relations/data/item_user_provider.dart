import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/item_user_db.dart';

final itemUserDBProvider = Provider<ItemUserDB>((ref) {
  return ItemUserDB(ref);
});
