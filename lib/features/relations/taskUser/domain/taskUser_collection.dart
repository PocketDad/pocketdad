import 'taskUser.dart';

/// Encapsulates operations on the list of [TaskUser] returned from Firestore.
class TaskUserCollection {
  TaskUserCollection(taskUsers) : _taskUsers = taskUsers;

  final List<TaskUser> _taskUsers;

  List<TaskUser> getTaskUsers() {
    return _taskUsers;
  }

  int size() {
    return _taskUsers.length;
  }
}
