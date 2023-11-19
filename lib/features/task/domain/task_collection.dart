import '../../item/domain/item.dart';
import '../../item/domain/item_collection.dart';
import '../../relations/taskUser/domain/taskUser_collection.dart';
import '../../relations/itemTask/domain/itemTask_collection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import 'task.dart';

/// Encapsulates operations on the list of [Task] returned from Firestore.
class TaskCollection {
  TaskCollection(tasks) : _tasks = tasks;

  final List<Task> _tasks;

  Task getTask(String taskID) {
    return _tasks.firstWhere((task) => task.id == taskID);
  }

  List<Task> getTasks(List<String> taskIDs) {
    return _tasks.where((task) => taskIDs.contains(task.id)).toList();
  }

  List<User> getAssociatedUsers(String taskID, UserCollection userCollection, TaskUserCollection taskUserCollection) {
    return userCollection.getUsers(taskUserCollection.getUserIDsWithTaskID(taskID));
  }

  List<Item> getAssociatedItems(String taskID, ItemCollection itemCollection, ItemTaskCollection itemTaskCollection) {
    return itemCollection.getItems(itemTaskCollection.getItemIDsWithTaskID(taskID));
  }

  int size() {
    return _tasks.length;
  }

  List<String> getTaskIDs() {
    return _tasks.map((data) => data.id).toList();
  }
}
