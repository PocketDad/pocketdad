import 'package:flutter/material.dart';
import 'package:pocketdad/src/views/home/pages/add_task.dart';
import 'package:pocketdad/src/views/home/pages/chat.dart';
import 'package:pocketdad/src/views/home/pages/check_in.dart';
import 'package:pocketdad/src/views/home/pages/choose_avatar.dart';
import 'package:pocketdad/src/views/home/pages/list_tasks.dart';

/// Top-level Layout for all of the "Home" related
class HomeView extends StatefulWidget {
  HomeView({
    super.key,
  });

  static const routeName = '/';

  // This data structure will eventually become stateful and thus will
  // need to be moved into the state widget.
  final Map pages = {
    0: {
      'title': const Text('Tasks'),
      'body': ListTasks(),
      'navItem': const BottomNavigationBarItem(
        icon: Icon(Icons.checklist),
        label: "Tasks",
      ),
    },
    1: {
      'title': const Text('Add Task'),
      'body': AddTask(),
      'navItem': const BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "Add Task",
      ),
    },
    2: {
      'title': const Text('Check In'),
      'body': const CheckIn(),
      'navItem': const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Check In",
      ),
    },
    3: {
      'title': const Text('Camera'),
      'body': const Chat(),
      'navItem': const BottomNavigationBarItem(
        icon: Icon(Icons.chat),
          label: "Chat"
      ),
    },
  };

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: widget.pages[_selectedIndex]['body']
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          widget.pages[0]['navItem'],
          widget.pages[1]['navItem'],
          widget.pages[2]['navItem'],
          widget.pages[3]['navItem'],
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber,
      ),
    );
  }
}