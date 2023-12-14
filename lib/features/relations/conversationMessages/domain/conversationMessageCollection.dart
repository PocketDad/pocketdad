import 'conversationMessage.dart';

/// Encapsulates operations on the list of [ConversationMessage] returned from Firestore.
class ConversationMessageCollection {
  ConversationMessageCollection(conversationMessages) : _conversationMessages = conversationMessages;

  final List<ConversationMessage> _conversationMessages;

  List<ConversationMessage> getConversationMessages() {
    return _conversationMessages;
  }

  int size() {
    return _conversationMessages.length;
  }

  List<String> getConversationIDsWithMessageID(messageID) {
    return _conversationMessages.where((conversationMessage) => conversationMessage.messageID == messageID).map((conversationMessage) => conversationMessage.conversationID).toList();
  }

  List<String> getMessageIDsWithConversationID(conversationID) {
    return _conversationMessages.where((conversationMessage) => conversationMessage.conversationID == conversationID).map((conversationMessage) => conversationMessage.messageID).toList();
  }
}
