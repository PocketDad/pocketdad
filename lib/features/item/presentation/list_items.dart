import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/user/domain/user_db.dart';
import 'package:pocketdad/features/item/presentation/list_item_item.dart';

import '../../relations/data/item_user_provider';
import '../domain/item_db.dart';
import '../../relations/domain/item_user_db.dart';

class ListItems extends ConsumerWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final String currentUserID = ref.watch(currentUserIDProvider);
    final ItemUserDB itemUserDB = ref.watch(itemUserDBProvider);
    final List<ItemData> associatedItems = itemUserDB.getAssociatedItems(currentUserID);
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
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              title: const Text(
                  "Items",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )
              )
          ),
          body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: associatedItems.map((item) => ListItemItem(item: item)).toList()
          ),
        ),
      ),
    );
  }
}