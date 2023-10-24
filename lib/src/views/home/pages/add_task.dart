import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data_models/task_db.dart';
import '../../../data_models/user_db.dart';
import '../../../data_models/item_db.dart';
// import task user db
// import item user db


class AddTask extends ConsumerWidget  {
  AddTask({Key? key}) : super(key: key);

  static const routeNae = '/addTask';
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderState>();
  final _descriptionFieldKey = GlobalKey<FormBuilderState>();
  final _usersFieldKey = GlobalKey<FormBuilderState>();
  final _openDateFieldKey = GlobalKey<FormBuilderState>();
  final _dueDateFieldKey = GlobalKey<FormBuilderState>();
  final _locationFieldKey = GlobalKey<FormBuilderState>();
  final _completitionDateFieldKey = GlobalKey<FormBuilderState>();
  final _itemFieldKey = GlobalKey<FormBuilderState>();
  final _notesFieldKey = GlobalKey<FormBuilderState>();
  final _completedFieldKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // work aroud riverpod stuff
    /* uncomment when main is updated
    final TaskDB taskDB = ref.watch(taskDBProvider);
    final UserDB userDB = ref.watch(userDBProvider);
    final ItemDB itemDB = ref.watch(itemDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);
    List<String> itemNames = itemDB.getItemNames();
    // ^ implement getItemNames in item_db.dart
    */
/*    
    void onSubmit() {
      String name = _nameFieldKey.currentState?.value;
      String description = _descriptionFieldKey.currentState?.value;
      List<String> users = _usersFieldKey.currentState?.value;
      DateTime openDate = _openDateFieldKey.currentState?.value;
      DateTime dueDate = _dueDateFieldKey.currentState?.value;
      String location = _locationFieldKey.currentState?.value;
      DateTime completionDate = _completitionDateFieldKey.currentState?.value;
      String item = _itemFieldKey
    }
*/

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add Task"),
        centerTitle: true,
      ),
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
      ),
    );
  }
}