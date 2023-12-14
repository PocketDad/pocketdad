import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';


@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required List<String> userIDs,
    @Default([]) List<String> messageIDs,
    required DateTime creationDate}) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

// // Test that the json file can be converted into entities.
// static Future<List<Conversation>> checkInitialData() async {
//   String content =
//   await rootBundle.loadString("assets/initialData/conversations.json");
//   List<dynamic> initialData = json.decode(content);
//   return initialData.map((jsonData) => Conversation.fromJson(jsonData)).toList();
// }
}
