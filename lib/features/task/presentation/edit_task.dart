import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/user/data/user_provider.dart';
import '../../item/data/item_provider.dart';
import '../../relations/data/item_task_provider.dart';
import '../data/task_provider.dart';
import '../domain/task_db.dart';
import '../../user/domain/user_db.dart';
import '../../item/domain/item_db.dart';
import '../../relations/domain/item_task_db.dart';
import '../../relations/domain/task_user_db.dart';

import 'form_fields/task_name_field.dart';
import 'form_fields/description_field.dart';
import 'form_fields/date_field.dart';
import 'form_fields/location_field.dart';
import 'form_fields/items_dropdown_field.dart';
import 'form_fields/submit_button.dart';
import 'form_fields/clear_button.dart';
import 'form_fields/users_dropdown_field.dart';

class EditTask extends ConsumerWidget  {
  EditTask({Key? key}) : super(key: key);

  static const routeName = '/edit_task';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _descriptionFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dueDateFieldKey = GlobalKey<FormBuilderFieldState>();
  final _locationFieldKey = GlobalKey<FormBuilderFieldState>();
  final _itemFieldKey = GlobalKey<FormBuilderFieldState>();
  final _usersFieldKey = GlobalKey<FormBuilderFieldState>();
  /* todo: implement notes and assigning users functionality
  final _notesFieldKey = GlobalKey<FormBuilderFieldState>(); */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TaskDB taskDB = ref.watch(taskDBProvider);
    final ItemDB itemDB = ref.watch(itemDBProvider);
    final UserDB userDB = ref.watch(userDBProvider);
    final ItemTaskDB itemTaskDB = ref.watch(itemTaskDBProvider);
    final TaskUserDB taskUserDB = ref.watch(taskUserDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);
    List<String> itemNames = itemDB.getItemNames();
    List<String> userNames = userDB.getUserNames();
    String taskID = ModalRoute.of(context)!.settings.arguments as String;
    TaskData taskData = taskDB.getTask(taskID);
    String currentItem = itemTaskDB.getAssociatedItem(taskID).itemID;
    List<String> currentUserIDs = userDB.getUserIDs(taskUserDB.getAssociatedUsers(taskID));
    String currentUsers = userDB.userIDsToString(currentUserIDs);
    /* todo: "friend system" so people can only assign specific users
    create users_dropdown_field.dart 
    final UserDB userDB = ref.watch(userDBProvider);
    */

    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      String name = _nameFieldKey.currentState?.value;
      String description = _descriptionFieldKey.currentState?.value;
      DateTime dueDate = _dueDateFieldKey.currentState?.value;
      String location = _locationFieldKey.currentState?.value;
      String item = itemDB.getItemIDFromName(_itemFieldKey.currentState?.value);
      List<String> users = _usersFieldKey.currentState?.value as List<String>;
      // current user will always be associated with task
      if (!users.contains(currentUserID)) {
        users.add(currentUserID);
      }

      taskDB.updateTask(
        taskID: taskID,
        name: name,
        description: description,
        dueDate: dueDate,
        location: location,
        itemID: item,
        userIDs: users
      );
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
                      currentName: taskData.name,),
                    TaskDescriptionField(
                      fieldKey: _descriptionFieldKey,
                      currentDescription: taskData.description,),
                    TaskDateField(
                      fieldKey: _dueDateFieldKey,
                      currentDate: taskData.dueDate,),
                    TaskLocationField(
                      fieldKey: _locationFieldKey,
                      currentLocation: taskData.location,),
                    ItemDropdownField(
                      fieldKey: _itemFieldKey, 
                      itemNames: itemNames,
                      currentItem: currentItem,),
                    UsersDropdownField(
                      fieldKey: _usersFieldKey, 
                      userNames: userNames,
                      currentUsers: currentUsers)
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