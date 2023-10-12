import 'package:flutter/material.dart';
import '../components/bottom_navigation_bar.dart';

class IndividualTask extends StatelessWidget {

  static const routeName = "/individualtask";

  const IndividualTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        // after linked to db, get task name
        title: const Text("Change oil"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: TextButton(
                onPressed: () {
                  int i = 0;
                  i++;
                  // change to reroute to item
                }, 
                child: const Text("Car (item name)",
                  style: TextStyle(
                    fontSize: 32,
                  )
                ),
              )
            ),
            // link to task due date
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text("Complete by 10/12/2023",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                )
              ),
            ),
            const Padding(
              // edit if padding needs to change throughout devices
              padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
              child: Text("Description: Pass in the description field for the task",
                style: TextStyle(
                  fontSize: 20
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextButton(
                onPressed: () {
                  int i = 0;
                  i++;
                  // change to reroute to item
                }, 
                child: const Text("Associated address/location",
                  style: TextStyle(
                    fontSize: 24,
                  )
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  int i = 0;
                  i++;
                  // change to reroute to item
                }, 
                child: const Text("View Instructions",
                  style: TextStyle(
                    fontSize: 32,
                  )
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ElevatedButton(
                onPressed: () {
                  int i = 0;
                  i++;
                  // change to reroute to item
                }, 
                child: const Text("Find Professional",
                  style: TextStyle(
                    fontSize: 32,
                  )
                ),
              )
            ),
            OverflowBar(
              alignment: MainAxisAlignment.start,
              children: [
                Padding(
                  // please find a better way to do this
                  padding: EdgeInsets.fromLTRB(275, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      int i = 0;
                      i++;
                      // change to add task
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 168, 214, 235)
                    ),
                    child: const Text("Edit",
                      style: TextStyle(
                        fontSize: 20,
                      )
                    )
                  ),
                )
              ],
            )
          ],
        ),
        )
    );
  }

}