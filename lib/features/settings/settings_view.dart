import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/settings/settings_db.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  /// Update the ThemeMode based on the user's selection.
  void updateThemeMode(ThemeMode? newThemeMode, WidgetRef ref) {
    if (newThemeMode == null) return;
    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == ref.read(currentThemeModeProvider)) return;
    // Otherwise, store the new ThemeMode in memory
    ref.read(currentThemeModeProvider.notifier).setThemeMode(newThemeMode);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Update the page if theme mode changes.
    ref.watch(currentThemeModeProvider);
    return Scaffold(
      // drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: ref.read(currentThemeModeProvider),
          onChanged: (ThemeMode? newThemeMode) =>
              updateThemeMode(newThemeMode, ref),
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
// class SettingsView extends StatelessWidget {
//   const SettingsView({super.key, required this.controller});
//
//   static const routeName = '/settings';
//
//   final SettingsController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         // Glue the SettingsController to the theme selection DropdownButton.
//         //
//         // When a user selects a theme from the dropdown list, the
//         // SettingsController is updated, which rebuilds the MaterialApp.
//         child: DropdownButton<ThemeMode>(
//           // Read the selected themeMode from the controller
//           value: controller.themeMode,
//           // Call the updateThemeMode method any time the user selects a theme.
//           onChanged: controller.updateThemeMode,
//           items: const [
//             DropdownMenuItem(
//               value: ThemeMode.system,
//               child: Text('System Theme'),
//             ),
//             DropdownMenuItem(
//               value: ThemeMode.light,
//               child: Text('Light Theme'),
//             ),
//             DropdownMenuItem(
//               value: ThemeMode.dark,
//               child: Text('Dark Theme'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
