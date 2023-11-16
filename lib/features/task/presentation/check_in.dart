import 'package:flutter/material.dart';
import 'package:pocketdad/features/settings/settings_controller.dart';
import 'package:pocketdad/features/settings/settings_service.dart';
import 'package:pocketdad/features/settings/settings_view.dart';
import 'package:pocketdad/features/task/presentation/single_task_card.dart';
import 'package:pocketdad/features/settings/settings_view.dart';

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
        actions: [
          SettingsView(controller: SettingsController(SettingsService())),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // greeting
              Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 15),
                child: Text(
                  "Good morning, kiddo!",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 32,
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
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      "Today you have 2 tasks",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10,),
                    ButtonTheme(
                      minWidth: 150,
                      height: 100,
                      child: SingleTaskCard(task: "Sample Task 1", date: "4/4/23", item: "House"),
                    ),
                    ButtonTheme(
                      minWidth: 150,
                      height: 100,
                      child: SingleTaskCard(task: "Sample Task 2", date: "4/4/23", item: "Car"),
                    ),
                  ]
                ),
              ),

              const Divider(
                color: Color(0xffbdbdbd),
                indent: 30,
                endIndent: 30,
              ),

              // week tasks
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 60),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      "This week you have 3 tasks",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10,),
                    ButtonTheme(
                      minWidth: 150,
                      height: 100,
                      child: SingleTaskCard(task: "Sample Task 3", date: "4/4/23", item: "House"),
                    ),
                    ButtonTheme(
                      minWidth: 150,
                      height: 100,
                      child: SingleTaskCard(task: "Sample Task 4", date: "4/4/23", item: "House"),
                    ),
                    ButtonTheme(
                      minWidth: 150,
                      height: 100,
                      child: SingleTaskCard(task: "Sample Task 5", date: "4/4/23", item: "House"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}