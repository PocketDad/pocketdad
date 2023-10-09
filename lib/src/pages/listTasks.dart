import 'package:flutter/material.dart';
import '../components/listTaskItem.dart';

class ListTasks extends StatelessWidget {
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
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
            children: [
              ListTaskItem(),
              ListTaskItem(),
              ListTaskItem(),
              ListTaskItem(),
              ListTaskItem(),
              ListTaskItem(),
              ListTaskItem()
            ]
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
            "Tasks",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          ListTaskItem(),
          ListTaskItem(),
          ListTaskItem()
        ]
        // Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 10.0),
        //       child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             IndividualTask(),
        //           ]
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 10.0),
        //       child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             IndividualTask(),
        //           ]
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 10.0),
        //       child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             IndividualTask(),
        //           ]
        //       ),
        //     ),
        //     TextButton(
        //         onPressed: () {},
        //         child: const Text(
        //           "Random!",
        //           textAlign: TextAlign.right,
        //         )
        //     )
        //   ],
        // ),
      ),
    );
  }
}