import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class AddTask extends ConsumerWidget  {
  AddTask({Key? key}) : super(key: key);

  static const routeName = '/add_task';
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
    final TaskDB taskDB = ref.watch(taskDBProvider);
    final ItemDB itemDB = ref.watch(itemDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);
    List<String> itemNames = itemDB.getItemNames();
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

      taskDB.addTask(
        name: name,
        description: description,
        dueDate: dueDate,
        location: location,
        itemID: item,
        userID: currentUserID
      );
      // todo: reroute to list tasks screen
    }

    void onClear() {
      _formKey.currentState?.reset();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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