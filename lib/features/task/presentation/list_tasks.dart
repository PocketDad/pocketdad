import 'package:flutter/material.dart';
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
import '../domain/task_db.dart';
import '../../user/domain/user_db.dart';
import 'list_task_item.dart';
import 'add_task.dart';

class ListTasks extends ConsumerWidget {
  ListTasks({Key? key}) : super(key: key);

  static const routeName = '/list_tasks';

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

    final List<Task> associatedTasks = userCollection.getAssociatedTasks(currentUserID, taskCollection, taskUserCollection);
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
            children: associatedTasks.map((task) => ListTaskItem(task: task)).toList()
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, AddTask.routeName);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
        )
        ),
      ),
    );
  }
}