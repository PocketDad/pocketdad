import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/chat/presentation/chat_bubble.dart';
import 'package:http/http.dart' as http;

import '../../all_data_provider.dart';
import '../../global_snackbar.dart';
import '../../item/domain/item.dart';
import '../../item/domain/item_collection.dart';
import '../../pocketDadError.dart';
import '../../pocketDadLoading.dart';
import '../../relations/conversationMessages/domain/conversationMessage.dart';
import '../../relations/conversationMessages/domain/conversationMessageCollection.dart';
import '../../relations/conversationMessages/presentation/edit_conversationMessage_controller.dart';
import '../../relations/itemTask/domain/itemTask.dart';
import '../../relations/itemTask/domain/itemTask_collection.dart';
import '../../relations/itemUser/domain/itemUser.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../relations/taskUser/domain/taskUser.dart';
import '../../relations/taskUser/domain/taskUser_collection.dart';
import '../../relations/userConversation/domain/userConversation.dart';
import '../../relations/userConversation/domain/userConversationCollection.dart';
import '../../relations/userConversation/presentation/edit_userConversation_controller.dart';
import '../../task/domain/task.dart';
import '../../task/domain/task_collection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import '../domain/conversation.dart';
import '../domain/conversation_collection.dart';
import '../domain/message.dart';
import '../domain/message_collection.dart';
import 'edit_conversation_controller.dart';
import 'edit_message_controller.dart';

class Chat extends ConsumerWidget {
  Chat({super.key});
  final chatProvider = Provider<List<ChatBubble>>((ref) {
    return [];
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                conversationMessages: allData.conversationMessages),
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
        required List<ConversationMessage> conversationMessages,
        required WidgetRef ref}) {

    ItemCollection itemCollection = ItemCollection(items);
    TaskCollection taskCollection = TaskCollection(tasks);
    UserCollection userCollection = UserCollection(users);
    ConversationCollection conversationCollection = ConversationCollection(conversations);
    MessageCollection messageCollection = MessageCollection(messages);
    ItemTaskCollection itemTaskCollection = ItemTaskCollection(itemTasks);
    ItemUserCollection itemUserCollection = ItemUserCollection(itemUsers);
    TaskUserCollection taskUserCollection = TaskUserCollection(taskUsers);
    UserConversationCollection userConversationCollection = UserConversationCollection(userConversations);
    ConversationMessageCollection conversationMessageCollection = ConversationMessageCollection(conversationMessages);

    final List<Task> associatedTasks = userCollection.getAssociatedTasks(currentUserID, taskCollection, taskUserCollection);
    final List<Conversation> associatedConversations = userCollection.getAssociatedConversations(currentUserID, conversationCollection, userConversationCollection);
    final dadID = "${currentUserID}Dad";

    Conversation initializeConversation() {
      int numConversations = conversationCollection.size();
      String conversationID = 'conversation-${(numConversations + 1).toString().padLeft(3, '0')}';
      Conversation conversation = Conversation(
          id: conversationID,
          userIDs: [currentUserID, dadID],
          creationDate: DateTime.now()
      );
      ref.read(editConversationControllerProvider.notifier).updateConversation(
        conversation: conversation,
        onSuccess: () {
          // do nothing
        },
      );
      int numUserConversations = userConversationCollection.size();
      String userConversationID = 'userConversation-${(numUserConversations + 1).toString().padLeft(3, '0')}';
      UserConversation userConversation = UserConversation(
          id: userConversationID,
          userID: currentUserID,
          conversationID: conversationID
      );
      ref.read(editUserConversationControllerProvider.notifier).updateUserConversation(
        userConversation: userConversation,
        onSuccess: () {
          // do nothing
        },
      );
      return conversation;
    }
    Conversation? conversation;
    if(associatedConversations.any((conversation) => conversation.userIDs.contains(dadID))) {
      conversation = associatedConversations.where((conversation) => conversation.userIDs.contains(dadID)).toList()[0];
    }

    List<Message> associatedMessages = [];
    if(conversation != null){
      associatedMessages = messageCollection.getMessagesFromConversationID(conversation.id, conversationMessageCollection);
    }

    void onSubmit(String value, Conversation? conversation) {
      if(conversation != null) {
        print("implement conversation update");
      } else {
        conversation = initializeConversation();
      }
      final numMessages = messageCollection.size();
      final messageID = 'message-${(numMessages + 1).toString().padLeft(3, '0')}';
      final responseID = 'message-${(numMessages + 2).toString().padLeft(3, '0')}';
      Message message = Message(
          id: messageID,
          senderID: currentUserID,
          text: value,
          sendDate: DateTime.now()
      );
      ref.read(editMessageControllerProvider.notifier).updateMessage(
        message: message,
        onSuccess: () {
          // do nothing
        },
      );
      Message response = Message(
        id: responseID,
        senderID: dadID,
        text: "Hi! This feature is not yet implemented.",
        sendDate: DateTime.now()
      );
      ref.read(editMessageControllerProvider.notifier).updateMessage(
        message: response,
        onSuccess: () {
          // do nothing
        },
      );
      List<String> messageIDs = [...associatedMessages.map((message) => message.id), messageID, responseID];
      Conversation updatedConversation = Conversation(
        id: conversation.id,
        userIDs: conversation.userIDs,
        messageIDs: messageIDs,
        creationDate: conversation.creationDate
      );
      ref.read(editConversationControllerProvider.notifier).updateConversation(
        conversation: updatedConversation,
        onSuccess: () {
          // do nothing
        },
      );

      final numConversationMessages = conversationMessageCollection.size();
      final conversationMessageID = 'conversationMessage-${(numConversationMessages + 1).toString().padLeft(3, '0')}';
      ConversationMessage conversationMessage = ConversationMessage(
          id: conversationMessageID,
          conversationID: conversation.id,
          messageID: messageID,
      );
      ref.read(editConversationMessageControllerProvider.notifier).updateConversationMessage(
        conversationMessage: conversationMessage,
        onSuccess: () {
          // do nothing
        },
      );
      final conversationMessageID2 = 'conversationMessage-${(numConversationMessages + 2).toString().padLeft(3, '0')}';
      ConversationMessage conversationMessage2 = ConversationMessage(
        id: conversationMessageID2,
        conversationID: conversation.id,
        messageID: responseID,
      );
      ref.read(editConversationMessageControllerProvider.notifier).updateConversationMessage(
        conversationMessage: conversationMessage2,
        onSuccess: () {
          // do nothing
        },
      );
    }

      // ref.watch(chatProvider).add(ChatBubble(message: value, isMe: true));
      // ref.watch(chatProvider).add(ChatBubble(message: "Hi! This feature is not yet implemented.", isMe: false));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: const Text("Chat with Dad"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
                builder: (context, watch, child) {
                  return ListView(
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    children: associatedMessages.map((message) => ChatBubble(message: message)).toList(),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ask me anything!',
              ),
              onSubmitted: (String value) => onSubmit(value, conversation),
            ),
          )
        ],
      ),
    );
  }

  completionFunction() async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['OPENAI_KEY']}'
      },
      body: jsonEncode(
        {
          "model": "text-davinci-003",
          "prompt": "this is a test prompt",
          "max_tokens": 250,
          "temperature": 0,
          "top_p": 1,
        }
      )
    );
  }
}
