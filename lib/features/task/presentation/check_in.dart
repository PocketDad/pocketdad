import 'package:flutter/material.dart';
import 'package:pocketdad/features/task/presentation/single_task_card.dart';

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
              padding: EdgeInsets.fromLTRB(0, 25, 0, 15),
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
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      color: Theme.of(context).colorScheme.onSurface,
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

            const Divider(
              color: Color(0xffbdbdbd),
              indent: 30,
              endIndent: 30,
            ),

            // today tasks
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(15, 5, 0, 15),
              child: Text(
                "Today you have 2 tasks",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            ButtonTheme(
              minWidth: 200,
              height: 100,
              child: SingleTaskCard(task: "Sample Task 1", date: "4/4/23", item: "house"),
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

            const Divider(
              color: Color(0xffbdbdbd),
              indent: 30,
              endIndent: 30,
            ),

            // week tasks
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(15, 5, 0, 15),
              child: Text(
                "This week you have 3 tasks",
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