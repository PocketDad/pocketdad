import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/task_db.dart';

final taskDBProvider = Provider<TaskDB>((ref) {
  return TaskDB(ref);
});