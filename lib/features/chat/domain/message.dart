import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String senderID,
    required String text,
    required DateTime sendDate}) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  // // Test that the json file can be converted into entities.
  // static Future<List<Message>> checkInitialData() async {
  //   String content =
  //   await rootBundle.loadString("assets/initialData/messages.json");
  //   List<dynamic> initialData = json.decode(content);
  //   return initialData.map((jsonData) => Message.fromJson(jsonData)).toList();
  // }
}
