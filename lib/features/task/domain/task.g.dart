// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      openDate: DateTime.parse(json['openDate'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      location: json['location'] as String?,
      completionDate: json['completionDate'] as String?,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'openDate': instance.openDate.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'location': instance.location,
      'completionDate': instance.completionDate,
      'notes': instance.notes,
      'completed': instance.completed,
    };
