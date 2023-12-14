import 'package:flutter/material.dart';
import '../domain/message.dart';


class ChatBubble extends StatelessWidget{

  const ChatBubble({super.key, required this.message, required this.currentUserID});

  final Message message;
  final String currentUserID;

  @override
  Widget build(BuildContext context) {


    final isMe = (message.senderID == currentUserID);
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: isMe ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }

}