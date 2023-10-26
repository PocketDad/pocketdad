import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  static const routeName = '/add_task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("PocketDad"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // task name
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Task name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                ),
              ),
            ),

            // date
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.calendar_month)
                ),
              ),
            ),
            // time
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.timelapse)
                ),
              ),
            ),

            // location
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.map)
                ),
              ),
            ),

            // notes
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Notes',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.map)
                ),
              ),
            ),

            // related items
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Related item',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  icon: Icon(Icons.arrow_drop_down)
                ),
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      int i = 0;
                      i++;
                      // change to add task
                    },
                    child: const Text("Add",
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
      ),
    );
  }
}