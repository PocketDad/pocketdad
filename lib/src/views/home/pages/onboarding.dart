import 'package:flutter/material.dart';
import 'package:pocketdad/src/data_models/user_db.dart';

class OnboardingForm extends StatelessWidget {

  static const routeName = '/';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();

  OnboardingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to PocketDad!",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Your name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Your email',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          UserData(
            email: emailController.text,
            id: "user-001",
            name: nameController.text,
            username: usernameController.text,
          );
        },
        child: const Icon(Icons.arrow_circle_right_outlined),
      ),
    );
  }
}
