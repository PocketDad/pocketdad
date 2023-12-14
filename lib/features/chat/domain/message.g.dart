// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      senderID: json['senderID'] as String,
      text: json['text'] as String,
      sendDate: DateTime.parse(json['sendDate'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderID': instance.senderID,
      'text': instance.text,
      'sendDate': instance.sendDate.toIso8601String(),
    };
