// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      initials: json['initials'] as String,
      imagePath: json['imagePath'] as String?,
      dadName: json['dadName'] as String?,
      dadPic: json['dadPic'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'initials': instance.initials,
      'imagePath': instance.imagePath,
      'dadName': instance.dadName,
      'dadPic': instance.dadPic,
    };
