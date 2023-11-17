/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String item(String chapterID) => 'chapters/$chapterID';
  static String items() => 'chapters';

  static String task(String taskID) => 'tasks/$taskID';
  static String tasks() => 'tasks';

  static String user(String userID) => 'users/$userID';
  static String users() => 'users';

  static String itemTask(String itemTaskID) => 'itemTasks/$itemTaskID';
  static String itemTasks() => 'itemTasks';

  static String itemUser(String itemUserID) => 'itemUsers/$itemUserID';
  static String itemUsers() => 'itemUsers';

  static String taskUser(String taskUserID) => 'taskUsers/$taskUserID';
  static String taskUsers() => 'taskUsers';
}
