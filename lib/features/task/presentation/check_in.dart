import 'package:flutter/material.dart';

class CheckIn extends StatelessWidget {

  static const routeName = '/';

  const CheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: const Text("Check In"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // greeting
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "Good morning, kiddo!",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),

            // dad joke of the day
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondary,
                  width: 5,
                )
              ),
              child: Column(
                children: [
                  Text(
                    'Dad Joke of the Day!',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    )
                    ,
                  ),
                  Text(
                      'Why did the drum go to bed? It was beat.',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      )
                  ),
                ],
              )
            ),


            // today tasks
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
              child: Text(
                "Today you have 2 tasks",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.left,
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
      ),
    );
  }
}