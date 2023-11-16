import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/task_db.dart';
import '../../relations/domain/task_user_db.dart';
import '../../user/domain/user_db.dart';
import 'list_task_item.dart';
import 'add_task.dart';

class ListTasks extends ConsumerWidget {
  ListTasks({Key? key}) : super(key: key);

  static const routeName = '/list_tasks';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final String currentUserID = ref.watch(currentUserIDProvider);
    final TaskUserDB taskUserDB = ref.watch(taskUserDBProvider);
    final List<TaskData> associatedTasks = taskUserDB.getAssociatedTasks(currentUserID);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Theme.of(context).colorScheme.secondary,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Filter by'),
              ],
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
                "Tasks",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,//???
                ),
            )
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: associatedTasks.map((task) => ListTaskItem(task: task)).toList()
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, AddTask.routeName);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
            backgroundColor: Theme.of(context).colorScheme.primary,
        )
        ),
      ),
    );
  }
}