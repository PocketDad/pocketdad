import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/user/domain/user_db.dart';

import '../user/data/user_provider.dart';
import '../common/home_view.dart';

class OnboardingForm extends ConsumerWidget {

  static const routeName = '/signup';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  // set password field

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
                Text(
                  "Welcome to PocketDad!",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary
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
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          // int thisID = (ref.watch(userDBProvider).getNextUserNum());
          // UserData(
          //   email: emailController.text,
          //   id: "user-$thisID",
          //   name: nameController.text,
          //   username: usernameController.text,
          // );
          // ref.read(currentUserIDProvider.notifier).state = "user-$thisID";
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomeView())
          // );
        },
        child: const Text(
          "Register"
        ),
      ),
    );
  }
}
