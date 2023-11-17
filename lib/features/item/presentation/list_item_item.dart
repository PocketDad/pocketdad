import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/item/domain/item_db.dart';

import '../../all_data_provider.dart';
import '../../pocketDadError.dart';
import '../../pocketDadLoading.dart';
import '../../relations/itemTask/domain/itemTask.dart';
import '../../relations/itemUser/domain/itemUser.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../relations/taskUser/domain/taskUser.dart';
import '../../relations/taskUser/domain/taskUser_collection.dart';
import '../../task/domain/task.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../../user/domain/user_db.dart';
import '../domain/item.dart';
import '../domain/item_collection.dart';

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
    return Center(
      child: Card(
        child: SizedBox(
            width: 300,
            height: 200,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  item.name,
                                  style:
                                  const TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                            ]
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (item.icon != "")
                              SizedBox(height: 80, child: Image.asset(item.icon),),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               const Text(
                                 textAlign: TextAlign.center,
                                 'Assigned users: ',
                                 style:
                                 TextStyle(
                                     fontSize: 14,
                                     color: Colors.black,
                                     fontWeight: FontWeight.w400
                                 )
                               ),
                              for (var i = 0; i < associatedUsers.length; i++)
                                Text(
                                    textAlign: TextAlign.center,
                                    '${associatedUsers.map((user) => (user.name))} ',
                                    style:
                                    const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                    )
                                ),
                            ]
                        ),
                      ]
                  ),
                  const Spacer(),
                ])
                )
        ),
      );
  }
}