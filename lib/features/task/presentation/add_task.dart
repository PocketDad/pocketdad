import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/user/data/user_provider.dart';
import 'package:pocketdad/features/pocketDadLoading.dart';
import '../../all_data_provider.dart';
import '../../common/home_view.dart';
import '../../global_snackbar.dart';
import '../../item/data/item_provider.dart';
import '../../item/domain/item.dart';
import '../../item/domain/item_collection.dart';
import '../../pocketDadError.dart';
import '../../relations/itemTask/domain/itemTask.dart';
import '../../relations/itemTask/domain/itemTask_collection.dart';
import '../../relations/itemTask/presentation/edit_itemTask_controller.dart';
import '../../relations/itemUser/domain/itemUser.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../relations/taskUser/domain/taskUser.dart';
import '../../relations/taskUser/domain/taskUser_collection.dart';
import '../../relations/taskUser/presentation/edit_taskUser_controller.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../data/task_provider.dart';
import '../domain/task.dart';
import '../domain/task_collection.dart';
import '../domain/task_db.dart';
import '../../user/domain/user_db.dart';
import '../../item/domain/item_db.dart';

import 'edit_task_controller.dart';
import 'form_fields/task_name_field.dart';
import 'form_fields/description_field.dart';
import 'form_fields/date_field.dart';
import 'form_fields/location_field.dart';
import 'form_fields/items_dropdown_field.dart';
import 'form_fields/submit_button.dart';
import 'form_fields/clear_button.dart';
import 'form_fields/users_dropdown_field.dart';
import 'list_tasks.dart';

class AddTask extends ConsumerWidget  {
  AddTask({Key? key}) : super(key: key);

  static const routeName = '/add_task';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _descriptionFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dueDateFieldKey = GlobalKey<FormBuilderFieldState>();
  final _locationFieldKey = GlobalKey<FormBuilderFieldState>();
  final _itemFieldKey = GlobalKey<FormBuilderFieldState>();
  final _usersFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
                context: context,
                ref: ref,
                currentUserID: allData.currentUserID,
                items: allData.items,
                tasks: allData.tasks,
                users: allData.users,
                itemTasks: allData.itemTasks,
                itemUsers: allData.itemUsers,
                taskUsers: allData.taskUsers),
        loading: () => const PocketDadLoading(),
        error: (error, st) => PocketDadError(error.toString(), st.toString()));
  }

  Widget _build(
    {required BuildContext context,
        required String currentUserID,
        required List<Item> items,
        required List<Task> tasks,
        required List<User> users,
        required List<ItemTask> itemTasks,
        required List<ItemUser> itemUsers,
        required List<TaskUser> taskUsers,
    required WidgetRef ref}) {

    ItemCollection itemCollection = ItemCollection(items);
    TaskCollection taskCollection = TaskCollection(tasks);
    UserCollection userCollection = UserCollection(users);
    ItemTaskCollection itemTaskCollection = ItemTaskCollection(itemTasks);
    ItemUserCollection itemUserCollection = ItemUserCollection(itemUsers);
    TaskUserCollection taskUserCollection = TaskUserCollection(taskUsers);
    items = itemCollection.getItemsFromUserID(currentUserID, itemUserCollection).toList();
    List<String> itemNames = [...items.map((item) => item.name), "None"].toList();
    Map<String, String> itemNameToID = {};
    for (var item in items) {
      itemNameToID[item.name] = item.id;
    }


    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      // Since validation passed, we can safely access the values.
      String name = _nameFieldKey.currentState?.value;
      String description = _descriptionFieldKey.currentState?.value;
      DateTime openDate = DateTime.now();
      DateTime dueDate = _dueDateFieldKey.currentState?.value;
      String location = _locationFieldKey.currentState?.value ?? '';
      String itemName = _itemFieldKey.currentState?.value;
      String itemID = itemNameToID[itemName] ?? '';
      int numTasks = taskCollection.size();

      String taskID = 'task-${(numTasks + 1).toString().padLeft(3, '0')}';
      Task task = Task(
          id: taskID,
          name: name,
          description: description,
          openDate: openDate,
          dueDate: dueDate,
          location: location
      );
      ref.read(editTaskControllerProvider.notifier).updateTask(
        task: task,
        onSuccess: () {
          GlobalSnackBar.show('Task "$name" added.');
        },
      );
      int numTaskUsers = taskUserCollection.size();
      String taskUserID = 'taskUser-${(numTaskUsers + 1).toString().padLeft(3, '0')}';
      TaskUser taskUser = TaskUser(
          id: taskUserID,
          taskID: taskID,
          userID: currentUserID
      );
      ref.read(editTaskUserControllerProvider.notifier).updateTaskUser(
        taskUser: taskUser,
        onSuccess: () {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        },
      );
      if(itemID != '') {
        int numItemTasks = itemTaskCollection.size();
        String itemTaskID = 'itemTask-${(numItemTasks + 1).toString().padLeft(3, '0')}';
        ItemTask itemTask = ItemTask(
          id: itemTaskID,
          itemID: itemID,
          taskID: taskID,
        );
        ref.read(editItemTaskControllerProvider.notifier).updateItemTask(
          itemTask: itemTask,
          onSuccess: () {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          },
        );
      }
    }

    void onClear() {
      _formKey.currentState?.reset();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Add Task"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    TaskNameField(fieldKey: _nameFieldKey),
                    TaskDescriptionField(fieldKey: _descriptionFieldKey),
                    TaskDateField(fieldKey: _dueDateFieldKey),
                    TaskLocationField(fieldKey: _locationFieldKey),
                    ItemDropdownField(fieldKey: _itemFieldKey, itemNames: itemNames),
                    // UsersDropdownField(fieldKey: _usersFieldKey, userNames: userNames)
                  ],
                )
              ),
              Row(
                children: [
                  SubmitButton(onSubmit: onSubmit),
                  ClearButton(onClear: onClear)
                ],
              )
            ],
          )
        ],
      )
    );
  }
}