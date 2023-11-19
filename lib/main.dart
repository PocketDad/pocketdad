import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'features/item/domain/item.dart';
import 'features/relations/itemTask/domain/itemTask.dart';
import 'features/relations/itemUser/domain/itemUser.dart';
import 'features/relations/taskUser/domain/taskUser.dart';
import 'features/settings/settings_controller.dart';
import 'features/settings/settings_service.dart';
import 'features/task/domain/task.dart';
import 'features/user/domain/user.dart';
import 'firebase_options.dart';

Future<bool> verifyInitialData() async {
  await Task.checkInitialData();
  await Item.checkInitialData();
  await ItemTask.checkInitialData();
  await ItemUser.checkInitialData();
  await TaskUser.checkInitialData();
  await User.checkInitialData();
  return true;
}

void main() async {
  // // Set up the SettingsController, which will glue user settings to multiple
  // // Flutter Widgets.
  // final settingsController = SettingsController(SettingsService());
  //
  // // Load the user's preferred theme while the splash screen is displayed.
  // // This prevents a sudden theme change when the app is first displayed.
  // await settingsController.loadSettings();
  //
  // // Run the app and pass in the SettingsController. The app listens to the
  // // SettingsController for changes, then passes it further down to the
  // // SettingsView.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  await verifyInitialData();
  runApp(
    const ProviderScope(child: MyApp()));
}
