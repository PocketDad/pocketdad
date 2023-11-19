import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/authentication/verify_email_view.dart';
import 'package:pocketdad/features/user/domain/user_db.dart';
import 'package:pocketdad/features/common/home_view.dart';
import 'package:pocketdad/features/authentication/onboarding.dart';

import '../user/data/user_provider.dart';

class SignIn extends ConsumerWidget {

  static const routeName = '/';

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  final attemptedLogIn = StateProvider<bool>((ref) => false);

  SignIn({super.key});

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
              SignInScreen(
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state) {
                    if (!state.user!.emailVerified) {
                      Navigator.pushNamed(context, VerifyEmailView.routeName);
                    } else {
                      Navigator.pushReplacementNamed(context, HomeView.routeName);
                    }
                  }),
                  AuthStateChangeAction<UserCreated>((context, state) {
                    if (!state.credential.user!.emailVerified) {
                      Navigator.pushNamed(context, VerifyEmailView.routeName);
                    } else {
                      Navigator.pushReplacementNamed(context, HomeView.routeName);
                    }
                  }),
                  AuthStateChangeAction<CredentialLinked>((context, state) {
                    if (!state.user.emailVerified) {
                      Navigator.pushNamed(context, VerifyEmailView.routeName);
                    } else {
                      Navigator.pushReplacementNamed(context, HomeView.routeName);
                    }
                  }),
                ],
              ),
              if (ref.watch(attemptedLogIn))
                Text(
                  "User not found. Please try again."
                ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    // if (ref.watch(userDBProvider).getUsername(usernameController.text) != null) {
                    //   ref.read(currentUserIDProvider.notifier).state = ref.watch(userDBProvider).getUsername(usernameController.text)!.id;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView())
                      );
                    // }
                    // else {
                    //   ref.read(attemptedLogIn.notifier).state = true;
                    // }
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