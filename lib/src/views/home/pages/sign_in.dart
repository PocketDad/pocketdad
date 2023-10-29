import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/src/data_models/user_db.dart';
import 'package:pocketdad/src/views/home/home_view.dart';
import 'package:pocketdad/src/views/home/pages/onboarding.dart';

class SignIn extends ConsumerWidget {

  static const routeName = '/';

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  final attemptedLogIn = StateProvider<bool>((ref) => false);

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
              if (ref.watch(attemptedLogIn))
                Text(
                  "User not found. Please try again."
                ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    if (ref.watch(userDBProvider).getUsername(usernameController.text) != null) {
                      ref.read(currentUserIDProvider.notifier).state = ref.watch(userDBProvider).getUsername(usernameController.text)!.id;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView())
                      );
                    }
                    else {
                      ref.read(attemptedLogIn.notifier).state = true;
                    }
                  },
                  child: const Text("Log in"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnboardingForm())
            );
          },
          child: Text("New user")
      ),
    );
  }
}