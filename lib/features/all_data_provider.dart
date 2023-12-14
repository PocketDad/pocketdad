import 'package:pocketdad/features/relations/itemTask/data/itemTask_provider.dart';
import 'package:pocketdad/features/relations/itemTask/domain/itemTask.dart';
import 'package:pocketdad/features/relations/itemUser/data/itemUser_provider.dart';
import 'package:pocketdad/features/relations/itemUser/domain/itemUser.dart';
import 'package:pocketdad/features/relations/taskUser/data/taskUser_provider.dart';
import 'package:pocketdad/features/relations/taskUser/domain/taskUser.dart';
import 'package:pocketdad/features/relations/userConversation/data/userConversation_provider.dart';
import 'package:pocketdad/features/relations/userConversation/domain/userConversation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'chat/data/conversation_provider.dart';
import 'chat/data/message_provider.dart';
import 'chat/domain/message.dart';
import 'chat/domain/conversation.dart';
import 'item/data/item_provider.dart';
import 'item/domain/item.dart';
import 'task/data/task_provider.dart';
import 'task/domain/task.dart';
import 'user/data/user_provider.dart';
import 'user/domain/user.dart';

part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData(
      {required this.items,
      required this.tasks,
      required this.users,
      required this.conversations,
      required this.messages,
      required this.itemTasks,
      required this.itemUsers,
      required this.taskUsers,
      required this.userConversations,
      required this.currentUserID});

  final List<Item> items;
  final List<Task> tasks;
  final List<User> users;
  final List<Conversation> conversations;
  final List<Message> messages;
  final List<ItemTask> itemTasks;
  final List<ItemUser> itemUsers;
  final List<TaskUser> taskUsers;
  final List<UserConversation> userConversations;
  final String currentUserID;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final items = ref.watch(itemsProvider.future);
  final tasks = ref.watch(tasksProvider.future);
  final users = ref.watch(usersProvider.future);
  final conversations = ref.watch(conversationsProvider.future);
  final messages = ref.watch(messagesProvider.future);
  final itemTasks = ref.watch(itemTasksProvider.future);
  final itemUsers = ref.watch(itemUsersProvider.future);
  final taskUsers = ref.watch(taskUsersProvider.future);
  final userConversations = ref.watch(userConversationsProvider.future);
  final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
      items: await items,
      tasks: await tasks,
      users: await users,
      conversations: await conversations,
      messages: await messages,
      itemTasks: await itemTasks,
      itemUsers: await itemUsers,
      taskUsers: await taskUsers,
      userConversations: await userConversations,
      currentUserID: currentUserID);
}
