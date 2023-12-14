// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: json['id'] as String,
      userIDs:
          (json['userIDs'] as List<dynamic>).map((e) => e as String).toList(),
      messageIDs: (json['messageIDs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      creationDate: DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userIDs': instance.userIDs,
      'messageIDs': instance.messageIDs,
      'creationDate': instance.creationDate.toIso8601String(),
    };
