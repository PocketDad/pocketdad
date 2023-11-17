import 'task.dart';

/// Encapsulates operations on the list of [Task] returned from Firestore.
class TaskCollection {
  TaskCollection(tasks) : _tasks = tasks;

  final List<Task> _tasks;

  Task getTask(String taskID) {
    return _tasks.firstWhere((data) => data.id == taskID);
  }

  int size() {
    return _tasks.length;
  }

  List<String> getTaskIDs() {
    return _tasks.map((data) => data.id).toList();
  }

  List<String> getAssociatedTaskIDs(userID) {
    return getTaskIDs()
        .where((taskID) => _userIsAssociated(taskID, userID))
        .toList();
  }

  List<Task> getAssociatedTasks(userID) {
    return _tasks
        .where((task) => _userIsAssociated(task.id, userID))
        .toList();
  }

  // List<String> getAssociatedUserIDs(taskID) {
  //   Task data = getTask(taskID);
  //   return [data.ownerID, ...data.viewerIDs, ...data.editorIDs];
  // }

  bool _userIsAssociated(String taskID, String userID) {
    Task data = getTask(taskID);
    return ((data.ownerID == userID) ||
        (data.viewerIDs.contains(userID)) ||
        (data.editorIDs.contains(userID)));
  }
}
