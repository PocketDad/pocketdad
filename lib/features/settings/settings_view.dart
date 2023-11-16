import 'package:flutter/material.dart';
import 'package:pocketdad/features/common/theme.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  final ThemeMode currentTheme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings, color: Colors.white,),
      onPressed: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Settings"),
            content: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Display name",
                        icon: Icon(Icons.person),
                      ),
                    ),
                    DropdownMenu<ThemeMode>(
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: ThemeMode.light, label: "Light"),
                        DropdownMenuEntry(value: ThemeMode.dark, label: "Dark"),
                      ],
                      onSelected: ,
                    )
                  ],
                ),
              ),
            ),
          );
        });
      }
    );
  }
}
