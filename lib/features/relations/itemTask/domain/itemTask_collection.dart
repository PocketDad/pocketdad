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
}
