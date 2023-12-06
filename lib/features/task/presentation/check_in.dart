import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/settings/settings_view.dart';
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
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../domain/task.dart';
import '../domain/task_collection.dart';

class CheckIn extends ConsumerWidget {

  static const routeName = '/';

  const CheckIn({super.key});

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
        required WidgetRef ref}){
    ItemCollection itemCollection = ItemCollection(items);
    TaskCollection taskCollection = TaskCollection(tasks);
    UserCollection userCollection = UserCollection(users);
    ItemTaskCollection itemTaskCollection = ItemTaskCollection(itemTasks);
    ItemUserCollection itemUserCollection = ItemUserCollection(itemUsers);
    TaskUserCollection taskUserCollection = TaskUserCollection(taskUsers);

    final DateTime currentTime = DateTime.now();
    final List<Task> associatedTasks = userCollection.getAssociatedTasks(currentUserID, taskCollection, taskUserCollection);
    final List<Task> todayTasks = associatedTasks.where((task) => task.dueDate?.difference(currentTime).inDays == 0).toList();
    final List<Task> weekTasks = associatedTasks.where((task) => 0 < (task.dueDate?.difference(currentTime).inDays ?? 0) &&
        (task.dueDate?.difference(currentTime).inDays ?? 7) < 7).toList();
    final List<Task> overDueTasks = associatedTasks.where((task) => (task.dueDate?.difference(currentTime).isNegative ?? false) && !task.completed).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        actions: const [
          SettingsView(),
        ],
        title: const Text("Check In"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // greeting
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 15),
                child: Text(
                  "Good morning, kiddo!",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 32,
                  ),
                ),
              ),

              // dad joke of the day
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 5,
                      )
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Dad Joke of the Day!',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        )
                        ,
                      ),
                      Text(
                          'Why did the drum go to bed? It was beat.',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          )
                      ),
                    ],
                  )
              ),

              const Divider(
                color: Color(0xffbdbdbd),
                indent: 30,
                endIndent: 30,
              ),

              // today tasks
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                alignment: Alignment.centerLeft,
                child: Column(
                    children: [
                      Text(
                        "Today you have ${todayTasks.length} tasks",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      ...todayTasks.map((task) => SingleTaskCard(task: task),
                      )
                    ]
                ),
              ),

              const Divider(
                color: Color(0xffbdbdbd),
                indent: 30,
                endIndent: 30,
              ),

              // week tasks
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      "This week you have ${weekTasks.length} tasks",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    ...weekTasks.map((task) => SingleTaskCard(task: task),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}