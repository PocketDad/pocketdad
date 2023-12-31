import '../../chat/domain/conversation.dart';
import '../../chat/domain/conversation_collection.dart';
import '../../item/domain/item.dart';
import '../../item/domain/item_collection.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../relations/taskUser/domain/taskUser_collection.dart';
import '../../relations/userConversation/domain/userConversationCollection.dart';
import '../../task/domain/task.dart';
import '../../task/domain/task_collection.dart';
import 'user.dart';

/// Encapsulates operations on the list of [User] returned from Firestore.
class UserCollection {
  UserCollection(users) : _users = users;

  final List<User> _users;

  int size() {
    return _users.length;
  }

  User getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  bool areUserNames(List<String> userNames) {
    List<String> allUserNames =
        _users.map((userData) => userData.username).toList();
    return userNames.every((userName) => allUserNames.contains(userName));
  }

  String getUserID(String emailOrUsername) {
    return (emailOrUsername.startsWith('@'))
        ? _users.firstWhere((user) => user.username == emailOrUsername).id
        : _users.firstWhere((user) => user.id == emailOrUsername).id;
  }

  bool isUserEmail(String email) {
    List<String> emails = _users.map((user) => user.id).toList();
    return emails.contains(email);
  }

  List<User> getUsers(List<String> userIDs) {
    return _users.where((user) => userIDs.contains(user.id)).toList();
  }

  List<String> getAllEmails() {
    return _users.map((user) => user.id).toList();
  }

  List<Item> getAssociatedItems(String userID, ItemCollection itemCollection, ItemUserCollection itemUserCollection) {
    return itemCollection.getItems(itemUserCollection.getItemIDsWithUserID(userID));
  }

  List<Task> getAssociatedTasks(String userID, TaskCollection taskCollection, TaskUserCollection taskUserCollection) {
    return taskCollection.getTasks(taskUserCollection.getTaskIDsWithUserID(userID));
  }

  List<Conversation> getAssociatedConversations(String userID, ConversationCollection conversationCollection, UserConversationCollection userConversationCollection) {
    return conversationCollection.getConversations(userConversationCollection.getConversationIDsWithUserID(userID));
  }
}
