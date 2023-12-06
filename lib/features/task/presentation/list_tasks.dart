import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/task/presentation/single_task_card.dart';
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
import '../../settings/settings_view.dart';
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
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
              titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            actions: const [
              SettingsView(),
            ],
            title: const Text("All Tasks"),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 60),
            children: associatedTasks.map((task) => (
                SingleTaskCard(task: task.name, date: task.dueDate.toString(), item: "ItemEx",))).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, AddTask.routeName);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
        )
        );
  }
}