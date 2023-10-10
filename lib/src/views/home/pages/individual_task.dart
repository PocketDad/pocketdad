import 'package:flutter/material.dart';
import '../components/bottom_navigation_bar.dart';

class IndividualTask extends StatelessWidget {

  static const routeName = "/individualtask";

  const IndividualTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // after linked to db, get task name
        title: const Text("Task Name"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextButton(
                onPressed: () {
                  int i = 0;
                  i++;
                  // change to reroute to item
                }, 
                child: const Text("Add",
                  style: TextStyle(
                  fontSize: 20,
                  )
                )
              )
            )
          ],
        ),
        )
    );
  }

}