// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pocketdad/features/task/domain/task_db.dart';
// import 'package:pocketdad/features/user/domain/user_db.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../task/data/task_provider.dart';
// import '../../user/data/user_provider.dart';
//
// class TaskUserData {
//   TaskUserData({
//     required this.taskID,
//     required this.userID,
//   });
//   String taskID;
//   String userID;
// }
//
// class TaskUserDB {
//   TaskUserDB(this.ref);
//
//   final ProviderRef<TaskUserDB> ref;
//
//   final List<TaskUserData> _taskUsers = [
//     TaskUserData(
//       taskID: 'task-001',
//       userID: 'user-001',
//     ),
//     TaskUserData(
//       taskID: 'task-002',
//       userID: 'user-001',
//     ),
//     TaskUserData(
//       taskID: 'task-003',
//       userID: 'user-001',
//     ),
//     TaskUserData(
//       taskID: 'task-004',
//       userID: 'user-001',
//     ),
//     TaskUserData(
//       taskID: 'task-005',
//       userID: 'user-001',
//     ),
//   ];
//
//   void addTaskUser({
//     required String taskID,
//     required String userID,}) {
//     TaskUserData data = TaskUserData(
//       taskID: taskID,
//       userID: userID
//     );
//     _taskUsers.add(data);
//   }
//
//   List<UserData> getAssociatedUsers(String taskID) {
//     UserDB userDB = ref.read(userDBProvider);
//     List<String> userIDs = _taskUsers.where((data) => data.taskID == taskID).map((data) => data.userID).toList();
//     return userDB.getUsers(userIDs);
//   }
//
//   List<TaskData> getAssociatedTasks(String userID) {
//     TaskDB taskDB = ref.read(taskDBProvider);
//     List<String> taskIDs = _taskUsers.where((data) => data.userID == userID).map((data) => data.taskID).toList();
//     return taskDB.getTasks(taskIDs);
//   }
//
//   void removeFromTaskID({
//     required String taskID}) {
//     _taskUsers.removeWhere((data) => data.taskID == taskID);
//   }
//
//   void removeFromUserID({
//     required String taskID}) {
//     _taskUsers.removeWhere((data) => data.taskID == taskID);
//   }
//
// }
//
// final taskUserDBProvider = Provider<TaskUserDB>((ref) {
//   return TaskUserDB(ref);
// });