import 'message.dart';

/// Encapsulates operations on the list of [Message] returned from Firestore.
class MessageCollection {
  MessageCollection(messages) : _messages = messages;

  final List<Message> _messages;

  Message getMessage(String messageID) {
    return _messages.firstWhere((message) => message.id == messageID);
  }

  List<Message> getMessages(List<String> messageIDs) {
    return _messages.where((message) => messageIDs.contains(message.id)).toList();
  }

  int size() {
    return _messages.length;
  }

  List<String> getMessageIDs() {
    return _messages.map((data) => data.id).toList();
  }
}
