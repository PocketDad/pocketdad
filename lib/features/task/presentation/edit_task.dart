import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../all_data_provider.dart';
import '../../item/domain/item.dart';
import '../../item/domain/item_collection.dart';
import '../../pocketDadError.dart';
import '../../pocketDadLoading.dart';
import '../../relations/itemTask/domain/itemTask.dart';
import '../../relations/itemTask/domain/itemTask_collection.dart';
import '../../relations/itemUser/domain/itemUser.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../relations/taskUser/domain/taskUser.dart';
import '../../relations/taskUser/domain/taskUser_collection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../domain/task.dart';
import '../domain/task_collection.dart';
import 'form_fields/task_name_field.dart';
import 'form_fields/description_field.dart';
import 'form_fields/date_field.dart';
import 'form_fields/location_field.dart';
import 'form_fields/items_dropdown_field.dart';
import 'form_fields/submit_button.dart';
import 'form_fields/clear_button.dart';

class EditTask extends ConsumerWidget  {
  EditTask({Key? key}) : super(key: key);

  static const routeName = '/edit_task';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _descriptionFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dueDateFieldKey = GlobalKey<FormBuilderFieldState>();
  final _locationFieldKey = GlobalKey<FormBuilderFieldState>();
  final _itemFieldKey = GlobalKey<FormBuilderFieldState>();
  /* todo: implement notes and assigning users functionality
  final _notesFieldKey = GlobalKey<FormBuilderState>();
  final _usersFieldKey = GlobalKey<FormBuilderState>(); */

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
    List<String> itemNames = itemCollection.getItemsFromUserID(currentUserID,  itemUserCollection).map((item) => item.name).toList();
    String taskID = ModalRoute.of(context)!.settings.arguments as String;
    Task task = taskCollection.getTask(taskID);
    // fix so that it's a list of items
    String currentItem = itemCollection.getItemsFromTaskID(taskID,  itemTaskCollection).first.name;

    /* todo: "friend system" so people can only assign specific users
    create users_dropdown_field.dart 
    final UserDB userDB = ref.watch(userDBProvider);
    */

    void onSubmit() {
      // bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      // if (!isValid) return;
      // String name = _nameFieldKey.currentState?.value;
      // String description = _descriptionFieldKey.currentState?.value;
      // DateTime dueDate = _dueDateFieldKey.currentState?.value;
      // String location = _locationFieldKey.currentState?.value;
      // String item = itemDB.getItemIDFromName(_itemFieldKey.currentState?.value);
      //
      // taskDB.updateTask(
      //   taskID: taskID,
      //   name: name,
      //   description: description,
      //   dueDate: dueDate,
      //   location: location,
      //   itemID: item,
      //   userID: currentUserID
      // );
      // todo: reroute to individual task screen
    }

    void onClear() {
      _formKey.currentState?.reset();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Edit Task"),
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
                    TaskNameField(
                      fieldKey: _nameFieldKey,
                      currentName: task.name,),
                    TaskDescriptionField(
                      fieldKey: _descriptionFieldKey,
                      currentDescription: task.description,),
                    TaskDateField(
                      fieldKey: _dueDateFieldKey,
                      currentDate: task.dueDate,),
                    TaskLocationField(
                      fieldKey: _locationFieldKey,
                      currentLocation: task.location,),
                    ItemDropdownField(
                      fieldKey: _itemFieldKey, 
                      itemNames: itemNames,
                      currentItem: currentItem,),
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