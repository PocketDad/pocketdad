// /// The data associated with users.
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../relations/domain/task_user_db.dart';
// import '../../relations/domain/item_task_db.dart';
// import '../../relations/data/itemTask_provider.dart';
//
// class TaskData {
//   TaskData(
//       {required this.id,
//         required this.name,
//         required this.description,
//         required this.openDate,
//         required this.dueDate,
//         this.location,
//         this.completionDate,
//         this.notes,
//         this.completed});
//
//   String id;
//   String name;
//   String description;
//   DateTime openDate;
//   DateTime dueDate;
//   DateTime? completionDate;
//   String? location;
//   List<String>? notes;
//   bool? completed;
// }
//
// /// Provides access to and operations on all defined users.
// class TaskDB {
//   TaskDB(this.ref);
//
//
//   final ProviderRef<TaskDB> ref;
//   final List<TaskData> _tasks = [
//     TaskData(
//         id: 'task-001',
//         name: 'Wash Car',
//         description: 'Nissan Versa should be cleaned',
//         openDate: DateTime.parse('2023-07-20 20:18:04Z'),
//         dueDate: DateTime.parse('2023-07-23 05:00:00Z'),
//         completionDate: null,
//         location: 'driveway',
//         notes: ['Your car should be cleaned every month'],
//         completed: false
//     ),
//     TaskData(
//         id: 'task-002',
//         name: 'Change Air filters',
//         description: 'The air conditioner\'s filter should be changed once every 4 months.',
//         openDate: DateTime.parse('2023-09-21 15:32:48Z'),
//         dueDate: DateTime.parse('2023-07-24 04:00:00Z'),
//         completionDate: null,
//         location: '114 East-West Blvd',
//         notes: ['Filters can be purchased on Amazon or at Home Depot'],
//         completed: false
//     ),
//     TaskData(
//         id: 'task-003',
//         name: 'Check Tire Tread',
//         description: 'Tire tread should be checked periodically.',
//         openDate: DateTime.parse('2023-10-10 12:32:42Z'),
//         dueDate: DateTime.parse('2023-12-23 07:00:00Z'),
//         completionDate: null,
//         location: 'driveway',
//         notes: ['The depth of the tread should 6/32 of an inch or deeper.'],
//         completed: false
//     ),
//     TaskData(
//         id: 'task-004',
//         name: 'Wash Car',
//         description: 'Nissan Versa should be cleaned',
//         openDate: DateTime.parse('2023-04-11 22:22:22Z'),
//         dueDate: DateTime.parse('2023-07-12 05:00:00Z'),
//         completionDate: null,
//         location: 'driveway',
//         notes: ['Your car should be cleaned every month'],
//         completed: false
//     ),
//     TaskData(
//         id: 'task-005',
//         name: 'Wash Car',
//         description: 'Nissan Versa should be cleaned',
//         openDate: DateTime.parse('2023-08-25 23:50:00Z'),
//         dueDate: DateTime.parse('2023-10-25 04:00:00Z'),
//         completionDate: null,
//         location: 'driveway',
//         notes: ['Your car should be cleaned every month'],
//         completed: false
//     ),
//   ];
//
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
//       id: taskID,
//       name: name,
//       description: description,
//       openDate: openDate,
//       dueDate: dueDate,
//       location: location
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
//       id: taskID,
//       name: name,
//       description: description,
//       openDate: openDate,
//       dueDate: dueDate,
//       location: location
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
