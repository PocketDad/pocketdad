import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/task/presentation/add_task.dart';
import 'package:pocketdad/features/chat/presentation/chat.dart';
import 'package:pocketdad/features/task/presentation/check_in.dart';
import 'package:pocketdad/features/user/presentation/choose_avatar.dart';
import 'package:pocketdad/features/task/presentation/list_tasks.dart';
import 'package:pocketdad/features/item/presentation/list_items.dart';

import '../all_data_provider.dart';
import '../chat/domain/conversation.dart';
import '../chat/domain/conversation_collection.dart';
import '../chat/domain/message.dart';
import '../chat/domain/message_collection.dart';
import '../item/domain/item.dart';
import '../item/domain/item_collection.dart';
import '../pocketDadError.dart';
import '../pocketDadLoading.dart';
import '../relations/itemTask/domain/itemTask.dart';
import '../relations/itemTask/domain/itemTask_collection.dart';
import '../relations/itemUser/domain/itemUser.dart';
import '../relations/itemUser/domain/itemUser_collection.dart';
import '../relations/taskUser/domain/taskUser.dart';
import '../relations/taskUser/domain/taskUser_collection.dart';
import '../relations/userConversation/domain/userConversation.dart';
import '../relations/userConversation/domain/userConversationCollection.dart';
import '../task/domain/task.dart';
import '../task/domain/task_collection.dart';
import '../user/domain/user.dart';
import '../user/domain/user_collection.dart';

/// Top-level Layout for all of the "Home" related
class HomeView extends ConsumerStatefulWidget {
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
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
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
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) =>
            _build(
                context: context,
                ref: ref,
                currentUserID: allData.currentUserID,
                items: allData.items,
                tasks: allData.tasks,
                users: allData.users,
                conversations: allData.conversations,
                messages: allData.messages,
                itemTasks: allData.itemTasks,
                itemUsers: allData.itemUsers,
                taskUsers: allData.taskUsers,
                userConversations: allData.userConversations,
                ),
        loading: () => const PocketDadLoading(),
        error: (error, st) => PocketDadError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
        required String currentUserID,
        required List<Item> items,
        required List<Task> tasks,
        required List<User> users,
        required List<Conversation> conversations,
        required List<Message> messages,
        required List<ItemTask> itemTasks,
        required List<ItemUser> itemUsers,
        required List<TaskUser> taskUsers,
        required List<UserConversation> userConversations,
        required WidgetRef ref}) {

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