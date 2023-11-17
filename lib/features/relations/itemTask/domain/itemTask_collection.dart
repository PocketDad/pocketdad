import '../../../item/domain/item.dart';
import 'itemTask.dart';

/// Encapsulates operations on the list of [ItemTask] returned from Firestore.
class ItemTaskCollection {
  ItemTaskCollection(itemTasks) : _itemTasks = itemTasks;

  final List<ItemTask> _itemTasks;

  List<ItemTask> getItemTasks() {
    return _itemTasks;
  }

  int size() {
    return _itemTasks.length;
  }

  List<String> getItemIDsWithTaskID(taskID) {
    return _itemTasks.where((itemTask) => itemTask.taskID == taskID).map((itemTask) => itemTask.itemID).toList();
  }

  List<String> getTaskIDsWithItemID(itemID) {
    return _itemTasks.where((itemTask) => itemTask.itemID == itemID).map((itemTask) => itemTask.taskID).toList();
  }
}
