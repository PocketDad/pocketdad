import 'package:flutter/material.dart';
import '../../../data_models/task_db.dart';
import '../../../data_models/user_db.dart';
import '../components/list_task_item.dart';

class ListTasks extends StatelessWidget {
  ListTasks({Key? key}) : super(key: key);

  List<TaskData> tasks = taskDB.getTasks(currentUserID);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Filter by'),
              ],
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text(
                "Tasks",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
            )
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: tasks.map((task) => ListTaskItem(task: task)).toList()
          )
        ),
      ),
    );
  }
}