// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userConversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserConversationImpl _$$UserConversationImplFromJson(
        Map<String, dynamic> json) =>
    _$UserConversationImpl(
      id: json['id'] as String,
      conversationID: json['conversationID'] as String,
      userID: json['userID'] as String,
    );

Map<String, dynamic> _$$UserConversationImplToJson(
        _$UserConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationID': instance.conversationID,
      'userID': instance.userID,
    };
