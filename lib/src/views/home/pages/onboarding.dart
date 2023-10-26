import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/src/data_models/user_db.dart';

class OnboardingForm extends ConsumerWidget {

  static const routeName = '/';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();

  OnboardingForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to PocketDad!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Your name',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Your email',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          UserData(
            email: emailController.text,
            id: "user-${(ref.watch(userDBProvider).getNextUserNum())}",
            name: nameController.text,
            username: usernameController.text,
          );
        },
        tooltip: "I'm ready!",
        child: const Icon(Icons.add),
      ),
    );
  }
}
