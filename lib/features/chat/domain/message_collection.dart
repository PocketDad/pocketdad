import '../../relations/conversationMessages/domain/conversationMessageCollection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';
import 'conversation.dart';
import 'conversation_collection.dart';
import 'message.dart';

/// Encapsulates operations on the list of [Message] returned from Firestore.
class MessageCollection {
  MessageCollection(conversations) : _conversations = conversations;

  final List<Message> _conversations;

  Message getMessage(String conversationID) {
    return _conversations.firstWhere((conversation) => conversation.id == conversationID);
  }

  List<Message> getMessages(List<String> conversationIDs) {
    return _conversations.where((conversation) => conversationIDs.contains(conversation.id)).toList();
  }

  List<Message> getMessagesFromConversationID(String conversationID, ConversationMessageCollection conversationMessageCollection) {
    return getMessages(conversationMessageCollection.getMessageIDsWithConversationID(conversationID));
  }

  int size() {
    return _conversations.length;
  }

  List<String> getMessageIDs() {
    return _conversations.map((data) => data.id).toList();
  }
}
