/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String item(String itemID) => 'items/$itemID';
  static String items() => 'items';

  static String task(String taskID) => 'tasks/$taskID';
  static String tasks() => 'tasks';

  static String user(String userID) => 'users/$userID';
  static String users() => 'users';

  static String conversation(String conversationID) => 'conversations/$conversationID';
  static String conversations() => 'conversations';

  static String message(String messageID) => 'messages/$messageID';
  static String messages() => 'messages';

  static String itemTask(String itemTaskID) => 'itemTasks/$itemTaskID';
  static String itemTasks() => 'itemTasks';

  static String itemUser(String itemUserID) => 'itemUsers/$itemUserID';
  static String itemUsers() => 'itemUsers';

  static String taskUser(String taskUserID) => 'taskUsers/$taskUserID';
  static String taskUsers() => 'taskUsers';

  static String userConversation(String userConversationID) => 'userConversations/$userConversationID';
  static String userConversations() => 'userConversations';

  static String conversationMessage(String conversationMessageID) => 'conversationMessages/$conversationMessageID';
  static String conversationMessages() => 'conversationMessages';
}
