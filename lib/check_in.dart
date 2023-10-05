import 'package:flutter/material.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("PocketDad"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // greeting
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                "Good morning, kiddo!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // dad joke of the day
            Container(
              margin: const EdgeInsets.fromLTRB(35, 0, 35, 10),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 251, 208, 19),
                  width: 7.5,
                )
              ),
              child: const Text(
                'Why did the drum go to bed? It was beat.',
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic
                )
              ),
            ),


            // today tasks
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
              child: Text(
                "Today you have 2 tasks",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int i = 0;
                i++;
                // change to point towards individual task
              },
              child: const Text("Clean the gutters",
                style: TextStyle(
                  fontSize: 24,
                )
              )
            ),
            ElevatedButton(
              onPressed: () {
                int i = 0;
                i++;
                // change to point towards individual task
              },
              child: const Text("Buy new filters",
                style: TextStyle(
                  fontSize: 24,
                )
              )
            ),

            // week tasks
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text(
                "This week you have 3 tasks",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int i = 0;
                i++;
                // change to point towards individual task
              },
              child: const Text("Change oil",
                style: TextStyle(
                  fontSize: 24,
                )
              )
            ),
            ElevatedButton(
              onPressed: () {
                int i = 0;
                i++;
                // change to point towards individual task
              },
              child: const Text("Call plumber for bathroom",
                style: TextStyle(
                  fontSize: 24,
                )
              )
            ),
            ElevatedButton(
              onPressed: () {
                int i = 0;
                i++;
                // change to point towards individual task
              },
              child: const Text("Restock the fridge",
                style: TextStyle(
                  fontSize: 24,
                )
              )
            ),
          ],
        ),
      )
    );
  }
}