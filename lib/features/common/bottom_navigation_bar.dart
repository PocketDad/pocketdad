import 'package:flutter/material.dart';

Widget bottomNavigationBar() {
  return BottomNavigationBar(
    // TODO: link icons to screens
    // change style/colors?
    items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label: "Tasks"
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "Add Task",
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chat"
      ),
    ],
  );
}