import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversationMessage.freezed.dart';
part 'conversationMessage.g.dart';

@freezed
class ConversationMessage with _$ConversationMessage {
  const factory ConversationMessage({
    required String id,
    required String conversationID,
    required String messageID,
  }) = _ConversationMessage;

  factory ConversationMessage.fromJson(Map<String, dynamic> json) => _$ConversationMessageFromJson(json);
}