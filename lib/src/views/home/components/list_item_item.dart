import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/src/data_models/item_db.dart';

import '../../../data_models/relations/item_user_db.dart';
import '../../../data_models/user_db.dart';

class ListItemItem extends ConsumerWidget {
  ListItemItem({Key? key, required this.item}) : super(key: key);

  final ItemData item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ItemUserDB itemUserDB = ref.watch(itemUserDBProvider);
    final List<UserData> associatedUsers = itemUserDB.getAssociatedUsers(item.id);
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