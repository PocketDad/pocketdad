import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'features/settings/settings_controller.dart';
import 'features/settings/settings_service.dart';
import 'firebase_options.dart';
import 'package:pocketdad/features/user/domain/user.dart';
import 'package:pocketdad/features/task/domain/task.dart';
import 'package:pocketdad/features/item/domain/item.dart';

Future<bool> verifyInitialData() async {
  // logger.i('Verifying initial data files: Chapter, Garden, News, User');
  await User.checkInitialData();
  await Task.checkInitialData();
  await Item.checkInitialData();
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  await verifyInitialData();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    ProviderScope(
      child: MyApp(settingsController: settingsController,),
    ),
  );
}
