// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversationMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationMessageImpl _$$ConversationMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationMessageImpl(
      id: json['id'] as String,
      conversationID: json['conversationID'] as String,
      messageID: json['messageID'] as String,
    );

Map<String, dynamic> _$$ConversationMessageImplToJson(
        _$ConversationMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationID': instance.conversationID,
      'messageID': instance.messageID,
    };
