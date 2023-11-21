import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/user/data/user_provider.dart';
import 'package:pocketdad/features/pocketDadLoading.dart';
import '../../all_data_provider.dart';
import '../../item/data/item_provider.dart';
import '../../item/domain/item.dart';
import '../../item/domain/item_collection.dart';
import '../../pocketDadError.dart';
import '../../relations/itemTask/domain/itemTask.dart';
import '../../relations/itemTask/domain/itemTask_collection.dart';
import '../../relations/itemUser/domain/itemUser.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../relations/taskUser/domain/taskUser.dart';
import '../../relations/taskUser/domain/taskUser_collection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../data/task_provider.dart';
import '../domain/task.dart';
import '../domain/task_collection.dart';
import '../domain/task_db.dart';
import '../../user/domain/user_db.dart';
import '../../item/domain/item_db.dart';

import 'form_fields/task_name_field.dart';
import 'form_fields/description_field.dart';
import 'form_fields/date_field.dart';
import 'form_fields/location_field.dart';
import 'form_fields/items_dropdown_field.dart';
import 'form_fields/submit_button.dart';
import 'form_fields/clear_button.dart';
import 'form_fields/users_dropdown_field.dart';

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
    // final TaskDB taskDB = ref.watch(taskDBProvider);
    // final ItemDB itemDB = ref.watch(itemDBProvider);
    // final UserDB userDB = ref.watch(userDBProvider);
    // final String currentUserID = ref.watch(currentUserIDProvider);
    // List<String> itemNames = itemDB.getItemNames();
    // List<String> userNames = userDB.getUserNames();
    //
    // void onSubmit() {
    //   bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
    //   if (!isValid) return;
    //   String name = _nameFieldKey.currentState?.value;
    //   String description = _descriptionFieldKey.currentState?.value;
    //   DateTime? dueDate = _dueDateFieldKey.currentState?.value;
    //   String? location = _locationFieldKey.currentState?.value;
    //   String? item = itemDB.getItemIDFromName(_itemFieldKey.currentState?.value);
    //   List<String>? userIDs = userDB.getUserIDsFromString(_usersFieldKey.currentState?.value);
    //   userIDs = userDB.validateUserNames(userIDs);
    //   if(!userIDs.contains(currentUserID)) {
    //     userIDs.add(currentUserID);
    //   }
    //
    //   taskDB.addTask(
    //     name: name,
    //     description: description,
    //     dueDate: dueDate,
    //     location: location,
    //     itemID: item,
    //     userIDs: userIDs
    //   );
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

    List<String> itemNames = itemCollection.getItemsFromUserID(currentUserID, itemUserCollection).map((item) => item.name).toList();

    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      int numTasks = taskCollection.size();
      String id = 'task-${(numTasks + 1).toString().padLeft(3, '0')}';
      String name = _nameFieldKey.currentState?.value;
      String description = _descriptionFieldKey.currentState?.value;
      DateTime openDate = DateTime.now();
      DateTime dueDate = _dueDateFieldKey.currentState?.value;
      String location = _locationFieldKey.currentState?.value;
      Task task = Task(
        id: id,
        name: name,
        description: description,
        dueDate: dueDate,
        openDate: openDate,
        location: location,
      );
      String item = itemCollection.getItemIDFromName(_itemFieldKey.currentState?.value);
      int numItemTasks = itemTaskCollection.size();
      String itemTaskID = 'itemTask-${(numItemTasks + 1).toString().padLeft(3, '0')}';
      ItemTask itemTask = ItemTask(
        id: itemTaskID, 
        itemID: item, 
        taskID: id
      );
      int numTaskUsers = taskUserCollection.size();
      String taskUserID = 'taskUser-${(numTaskUsers + 1).toString().padLeft(3, '0')}';
      TaskUser taskUser = TaskUser(
        id: taskUserID, 
        taskID: id, 
        userID: currentUserID
      );
      //ref.read()


      
      // taskDB.addTask(
      //   name: name,
      //   description: description,
      //   dueDate: dueDate,
      //   location: location,
      //   itemID: item,
      //   userID: currentUserID
      // );
      // todo: reroute to list tasks screen
      Navigator.pop(context);
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