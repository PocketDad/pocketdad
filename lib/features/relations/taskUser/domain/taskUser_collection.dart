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

  List<String> getUserIDsWithTaskID(taskID) {
    return _taskUsers.where((taskUser) => taskUser.taskID == taskID).map((taskUser) => taskUser.userID).toList();
  }

  List<String> getTaskIDsWithUserID(userID) {
    return _taskUsers.where((taskUser) => taskUser.userID == userID).map((taskUser) => taskUser.taskID).toList();
  }
}
