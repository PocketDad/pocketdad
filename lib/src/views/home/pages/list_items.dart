import 'package:flutter/material.dart';
import 'package:pocketdad/src/views/home/components/list_item_item.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});
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
              children: const [
                ListItemItem('item-001'),
                ListItemItem('item-002'),
                ListItemItem('item-003'),
              ]
          ),
        ),
      ),
    );
  }
}