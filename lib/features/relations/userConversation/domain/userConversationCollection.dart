import 'userConversation.dart';

/// Encapsulates operations on the list of [UserConversation] returned from Firestore.
class UserConversationCollection {
  UserConversationCollection(userConversations) : _userConversations = userConversations;

  final List<UserConversation> _userConversations;

  List<UserConversation> getUserConversations() {
    return _userConversations;
  }

  int size() {
    return _userConversations.length;
  }

  List<String> getUserIDsWithConversationID(conversationID) {
    return _userConversations.where((userConversation) => userConversation.conversationID == conversationID).map((userConversation) => userConversation.userID).toList();
  }

  List<String> getConversationIDsWithUserID(userID) {
    return _userConversations.where((userConversation) => userConversation.userID == userID).map((userConversation) => userConversation.conversationID).toList();
  }
}
