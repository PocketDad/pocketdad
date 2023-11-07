import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/task/domain/task_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../item/data/item_provider.dart';
import '../../item/domain/item_db.dart';
import '../../task/data/task_provider.dart';

class ItemTaskData {
  ItemTaskData({
    required this.itemID,
    required this.taskID,
  });
  String itemID;
  String taskID;
}

class ItemTaskDB {
  ItemTaskDB(this.ref);

  final ProviderRef<ItemTaskDB> ref;

  final List<ItemTaskData> _itemTasks = [
    ItemTaskData(
      itemID: 'item-001',
      taskID: 'task-001',
    ),
    ItemTaskData(
      itemID: 'item-002',
      taskID: 'task-002',
    ),
    ItemTaskData(
      itemID: 'item-003',
      taskID: 'task-003',
    ),
    ItemTaskData(
      itemID: 'item-001',
      taskID: 'task-004',
    ),
    ItemTaskData(
      itemID: 'item-001',
      taskID: 'task-005',
    ),
  ];

  void addItemTask({
    required String taskID,
    required String itemID,}) {
    ItemTaskData data = ItemTaskData(
      taskID: taskID,
      itemID: itemID
    );
    _itemTasks.add(data);
  }

  void removeFromTaskID({
    required String taskID}) {
    _itemTasks.removeWhere((data) => data.taskID == taskID);
  }

  List<ItemData> getAssociatedItems(String taskID) {
    ItemDB itemDB = ref.read(itemDBProvider);
    List<String> itemIDs = _itemTasks.where((data) => data.taskID == taskID).map((data) => data.itemID).toList();
    return itemDB.getItems(itemIDs);
  }

  List<TaskData> getAssociatedTasks(String itemID) {
    TaskDB taskDB = ref.read(taskDBProvider);
    List<String> taskIDs = _itemTasks.where((data) => data.itemID == itemID).map((data) => data.taskID).toList();
    return taskDB.getTasks(taskIDs);
  }
}
