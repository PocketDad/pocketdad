import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/task/presentation/list_tasks.dart';
import 'package:pocketdad/features/user/data/user_provider.dart';
import '../../item/data/item_provider.dart';
import '../data/task_provider.dart';
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
    final TaskDB taskDB = ref.watch(taskDBProvider);
    final ItemDB itemDB = ref.watch(itemDBProvider);
    final UserDB userDB = ref.watch(userDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);
    List<String> itemNames = itemDB.getItemNames();
    List<String> userNames = userDB.getUserNames();

    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      String name = _nameFieldKey.currentState?.value;
      String description = _descriptionFieldKey.currentState?.value;
      DateTime? dueDate = _dueDateFieldKey.currentState?.value;
      String? location = _locationFieldKey.currentState?.value;
      String? item = itemDB.getItemIDFromName(_itemFieldKey.currentState?.value);
      List<String>? userIDs = userDB.getUserIDsFromString(_usersFieldKey.currentState?.value);
      userIDs = userDB.validateUserNames(userIDs);
      if(!userIDs.contains(currentUserID)) {
        userIDs.add(currentUserID);
      }

      taskDB.addTask(
        name: name,
        description: description,
        dueDate: dueDate,
        location: location,
        itemID: item,
        userIDs: userIDs
      );
      // todo: reroute to list tasks screen
      // Navigator.pushReplacementNamed(context, ListTasks.routeName);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListTasks())
        );
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
                    UsersDropdownField(fieldKey: _usersFieldKey, userNames: userNames)
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