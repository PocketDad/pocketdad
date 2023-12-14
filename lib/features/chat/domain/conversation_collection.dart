import '../../relations/userConversation/domain/userConversationCollection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import 'conversation.dart';

/// Encapsulates operations on the list of [Conversation] returned from Firestore.
class ConversationCollection {
  ConversationCollection(conversations) : _conversations = conversations;

  final List<Conversation> _conversations;

  Conversation getConversation(String conversationID) {
    return _conversations.firstWhere((conversation) => conversation.id == conversationID);
  }

  List<Conversation> getConversations(List<String> conversationIDs) {
    return _conversations.where((conversation) => conversationIDs.contains(conversation.id)).toList();
  }

  List<User> getAssociatedUsers(String conversationID, UserCollection userCollection, UserConversationCollection userConversationCollection) {
    return userCollection.getUsers(userConversationCollection.getUserIDsWithConversationID(conversationID));
  }

  List<Conversation> getConversationsFromUserID(String userID, UserConversationCollection userConversationCollection) {
    return getConversations(userConversationCollection.getConversationIDsWithUserID(userID));
  }

  int size() {
    return _conversations.length;
  }

  List<String> getConversationIDs() {
    return _conversations.map((data) => data.id).toList();
  }
}
