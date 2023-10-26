import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data_models/task_db.dart';
import '../../../data_models/user_db.dart';
import '../../../data_models/item_db.dart';

import 'list_tasks.dart';
import '../form-fields/task_name_field.dart';
import '../form-fields/description_field.dart';
import '../form-fields/date_field.dart';
import '../form-fields/location_field.dart';
import '../form-fields/items_dropdown_field.dart';
import '../form-fields/submit_button.dart';
import '../form-fields/clear_button.dart';
// import task user db
// import item user db
// todo: create notes db


class AddTask extends ConsumerWidget  {
  AddTask({Key? key}) : super(key: key);

  static const routeNae = '/addTask';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _descriptionFieldKey = GlobalKey<FormBuilderFieldState>();
  final _dueDateFieldKey = GlobalKey<FormBuilderFieldState>();
  final _locationFieldKey = GlobalKey<FormBuilderFieldState>();
  final _itemFieldKey = GlobalKey<FormBuilderFieldState>();
  /* to be implemented with Notes db and assigning users functionality
  final _notesFieldKey = GlobalKey<FormBuilderState>();
  final _usersFieldKey = GlobalKey<FormBuilderState>(); */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TaskDB taskDB = ref.watch(taskDBProvider);
    final UserDB userDB = ref.watch(userDBProvider);
    final ItemDB itemDB = ref.watch(itemDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);
    List<String> itemNames = itemDB.getItemNames();
    
    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      String name = _nameFieldKey.currentState?.value;
      String description = _descriptionFieldKey.currentState?.value;
      DateTime dueDate = _dueDateFieldKey.currentState?.value;
      String location = _locationFieldKey.currentState?.value;
      // String item = itemDB.getItem(_itemFieldKey.currentState?.value);

      taskDB.addTask(
        name: name,
        description: description,
        dueDate: dueDate,
        location: location
      );
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

      /* initial mockup, delete later
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // task name
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Task name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                ),
              ),
            ),

            // date
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.calendar_month)
                ),
              ),
            ),
            // time
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.timelapse)
                ),
              ),
            ),

            // location
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.map)
                ),
              ),
            ),

            // notes
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Notes',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.map)
                ),
              ),
            ),

            // related items
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Related item',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.arrow_drop_down)
                ),
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      int i = 0;
                      i++;
                      // change to add task
                    },
                    child: const Text("Add",
                      style: TextStyle(
                        fontSize: 20,
                      )
                    )
                  ),
                )
              ],
            )
          ],
        ),
      ),*/
    );
  }
}