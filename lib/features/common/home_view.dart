import 'package:flutter/material.dart';
import 'package:pocketdad/features/task/presentation/add_task.dart';
import 'package:pocketdad/features/chat/presentation/chat.dart';
import 'package:pocketdad/features/task/presentation/check_in.dart';
import 'package:pocketdad/features/user/presentation/choose_avatar.dart';
import 'package:pocketdad/features/task/presentation/list_tasks.dart';
import 'package:pocketdad/features/item/presentation/list_items.dart';

/// Top-level Layout for all of the "Home" related
class HomeView extends StatefulWidget {
  HomeView({
    super.key,
  });

  static const routeName = '/home';

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
      'title': const Text('Check In'),
      'body': const CheckIn(),
      'navItem': const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Check In",
      ),
    },
    2: {
      'title': const Text('Chat'),
      'body': Chat(),
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
  int _selectedIndex = 1;

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
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber,
      ),
    );
  }
}