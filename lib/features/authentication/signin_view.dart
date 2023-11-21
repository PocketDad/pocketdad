import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ForgotPasswordView;
import 'package:flutter/material.dart';

import '../common/home_view.dart';
import 'decorations.dart';
import 'forgot_password_view.dart';
import 'verify_email_view.dart';

/// Builds the page containing fields to enter a username and password, plus buttons.
class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            ForgotPasswordView.routeName,
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
          // if (!state.user!.emailVerified) {
          //   Navigator.pushNamed(context, VerifyEmailView.routeName);
          // } else {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          // }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          // if (!state.credential.user!.emailVerified) {
          //   Navigator.pushNamed(context, VerifyEmailView.routeName);
          // } else {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          // }
        }),
        AuthStateChangeAction<CredentialLinked>((context, state) {
          // if (!state.user.emailVerified) {
          //   Navigator.pushNamed(context, VerifyEmailView.routeName);
          // } else {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          // }
        }),
      ],
      styles: const {
        EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
      },
      // headerBuilder: headerImage('assets/images/vegetables.png'),
      // sideBuilder: sideImage('assets/images/vegetables.png'),
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome to PocketDad!",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Row(
                children: [
                  Text(
                    action == AuthAction.signIn
                        ? 'Please sign in.'
                        : 'Please create an account.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
                    textAlign: TextAlign.start,
                  ),
                ],
              )
            ],
          ),
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? 'By signing in, you agree to our terms and conditions.'
                  : 'By registering, you agree to our terms and conditions.',
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pocketdad/features/user/domain/user_db.dart';
// import 'package:pocketdad/features/common/home_view.dart';
// import 'package:pocketdad/features/authentication/onboarding.dart';
//
// import '../user/data/user_provider.dart';
//
// class SignIn extends ConsumerWidget {
//
//   static const routeName = '/';
//
//   final usernameController = TextEditingController();
//   final emailController = TextEditingController();
//
//   final attemptedLogIn = StateProvider<bool>((ref) => false);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
//     return asyncAllData.when(
//         data: (allData) =>
//             _build(
//                 context: context,
//                 ref: ref,
//                 currentUserID: allData.currentUserID,
//                 items: allData.items,
//                 tasks: allData.tasks,
//                 users: allData.users,
//                 itemTasks: allData.itemTasks,
//                 itemUsers: allData.itemUsers,
//                 taskUsers: allData.taskUsers),
//         loading: () => const PocketDadLoading(),
//         error: (error, st) => PocketDadError(error.toString(), st.toString()));
//   }
//
//   Widget _build(
//       {required BuildContext context,
//         required String currentUserID,
//         required List<Item> items,
//         required List<Task> tasks,
//         required List<User> users,
//         required List<ItemTask> itemTasks,
//         required List<ItemUser> itemUsers,
//         required List<TaskUser> taskUsers,
//         required WidgetRef ref}) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Welcome to PocketDad!",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20,),
//               TextField(
//                 controller: usernameController,
//                 decoration: const InputDecoration(
//                   filled: true,
//                   labelText: 'Username',
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 2.0,
//                       color: Colors.orangeAccent,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               if (ref.watch(attemptedLogIn))
//                 Text(
//                   "User not found. Please try again."
//                 ),
//               const SizedBox(height: 20,),
//               ElevatedButton(
//                   onPressed: () {
//                     var username = usernameController.text;
//                     // if (ref.watch(userDBProvider).getUsername(usernameController.text) != null) {
//                     //   ref.read(currentUserIDProvider.notifier).state = ref.watch(userDBProvider).getUsername(usernameController.text)!.id;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomeView())
//                       );
//                     // }
//                     // else {
//                     //   ref.read(attemptedLogIn.notifier).state = true;
//                     // }
//                   },
//                   child: const Text("Log in"),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: ElevatedButton(
//         // When the user presses the button, show an alert dialog containing
//         // the text that the user has entered into the text field.
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => OnboardingForm())
//             );
//           },
//           child: Text("New user")
//       ),
//     );
//   }
// }