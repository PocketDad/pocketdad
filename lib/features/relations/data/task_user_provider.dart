import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/task_user_db.dart';

final taskUserDBProvider = Provider<TaskUserDB>((ref) {
  return TaskUserDB(ref);
});