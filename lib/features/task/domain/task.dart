import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String name,
    required String description,
    required DateTime openDate,
    DateTime? dueDate,
    String? location,
    String? completionDate,
    @Default([]) List<String> notes,
    bool? completed}) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Task>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/gardens.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Task.fromJson(jsonData)).toList();
  }
}

//   void addTask({
//     required String name,
//     required String description,
//     required DateTime dueDate,
//     required String location,
//     required String userID,
//     required String itemID,}) {
//     String taskID = 'task-${(_tasks.length + 1).toString().padLeft(3, '0')}';
//     DateTime openDate = DateTime.now();
//     TaskData data = TaskData(
//         id: taskID,
//         name: name,
//         description: description,
//         openDate: openDate,
//         dueDate: dueDate,
//         location: location
//     );
//     _tasks.add(data);
//     final TaskUserDB taskUserDB = ref.read(taskUserDBProvider);
//     final ItemTaskDB itemTaskDB = ref.read(itemTaskDBProvider);
//     taskUserDB.addTaskUser(taskID: taskID, userID: userID);
//     itemTaskDB.addItemTask(taskID: taskID, itemID: itemID);
//   }
//
//   // todo: updateTask
//   void updateTask({
//     required String taskID,
//     required String name,
//     required String description,
//     required DateTime dueDate,
//     required String location,
//     required String userID,
//     required String itemID,
//   }) {
//     // remakes task instance
//     _tasks.removeWhere((data) => data.id == taskID);
//     // remakes itemTask instance
//     final ItemTaskDB itemTaskDB = ref.read(itemTaskDBProvider);
//     itemTaskDB.removeFromTaskID(taskID: taskID);
//     DateTime openDate = DateTime.now();
//     TaskData data = TaskData(
//         id: taskID,
//         name: name,
//         description: description,
//         openDate: openDate,
//         dueDate: dueDate,
//         location: location
//     );
//     _tasks.add(data);
//     itemTaskDB.addItemTask(taskID: taskID, itemID: itemID);
//   }
//
//   TaskData getTask(String taskID) {
//     return _tasks.firstWhere((taskData) => taskData.id == taskID);
//   }
//
//   List<TaskData> getTasks(List<String> taskIDs) {
//     return taskIDs.map((taskID) => getTask(taskID)).toList();
//   }
//
//   List<String> getTaskNames() {
//     return _tasks.map((task) => task.name).toList();
//   }
// }
