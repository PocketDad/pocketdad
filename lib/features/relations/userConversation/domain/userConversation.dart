import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'userConversation.freezed.dart';
part 'userConversation.g.dart';

@freezed
class UserConversation with _$UserConversation {
  const factory UserConversation({
    required String id,
    required String conversationID,
    required String userID,
  }) = _UserConversation;

  factory UserConversation.fromJson(Map<String, dynamic> json) => _$UserConversationFromJson(json);

  // // Test that the json file can be converted into entities.
  // static Future<List<UserConversation>> checkInitialData() async {
  //   String content =
  //   await rootBundle.loadString("assets/initialData/userConversations.json");
  //   List<dynamic> initialData = json.decode(content);
  //   return initialData.map((jsonData) => UserConversation.fromJson(jsonData)).toList();
  // }
}