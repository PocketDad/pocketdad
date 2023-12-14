import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../all_data_provider.dart';
import '../../pocketDadError.dart';
import '../../pocketDadLoading.dart';
import '../../relations/itemTask/domain/itemTask.dart';
import '../../relations/itemUser/domain/itemUser.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../relations/taskUser/domain/taskUser.dart';
import '../../task/domain/task.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../domain/item.dart';
import '../domain/item_collection.dart';
import '../presentation/list_tasks_for_item.dart';

class ListItemItem extends ConsumerWidget {
  ListItemItem({Key? key, required this.item}) : super(key: key);

  final Item item;

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

  @override
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
    UserCollection userCollection = UserCollection(users);ItemUserCollection itemUserCollection = ItemUserCollection(itemUsers);
    final List<User> associatedUsers = itemCollection.getAssociatedUsers(item.id, userCollection, itemUserCollection);
    return ButtonTheme(
      minWidth: 150,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(15)
            )
        ),
        color: Theme.of(context).colorScheme.surface,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.all(15),
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    ListTasksForItem(item: item,); // TODO: fix routing
                  },
                  child: Text(
                    item.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                    'assets/images/car.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Assigned users: xx, xx"), // TODO: make real
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}