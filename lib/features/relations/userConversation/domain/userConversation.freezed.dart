// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userConversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserConversation _$UserConversationFromJson(Map<String, dynamic> json) {
  return _UserConversation.fromJson(json);
}

/// @nodoc
mixin _$UserConversation {
  String get id => throw _privateConstructorUsedError;
  String get conversationID => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserConversationCopyWith<UserConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserConversationCopyWith<$Res> {
  factory $UserConversationCopyWith(
          UserConversation value, $Res Function(UserConversation) then) =
      _$UserConversationCopyWithImpl<$Res, UserConversation>;
  @useResult
  $Res call({String id, String conversationID, String userID});
}

/// @nodoc
class _$UserConversationCopyWithImpl<$Res, $Val extends UserConversation>
    implements $UserConversationCopyWith<$Res> {
  _$UserConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationID = null,
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      conversationID: null == conversationID
          ? _value.conversationID
          : conversationID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserConversationImplCopyWith<$Res>
    implements $UserConversationCopyWith<$Res> {
  factory _$$UserConversationImplCopyWith(_$UserConversationImpl value,
          $Res Function(_$UserConversationImpl) then) =
      __$$UserConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String conversationID, String userID});
}

/// @nodoc
class __$$UserConversationImplCopyWithImpl<$Res>
    extends _$UserConversationCopyWithImpl<$Res, _$UserConversationImpl>
    implements _$$UserConversationImplCopyWith<$Res> {
  __$$UserConversationImplCopyWithImpl(_$UserConversationImpl _value,
      $Res Function(_$UserConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationID = null,
    Object? userID = null,
  }) {
    return _then(_$UserConversationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      conversationID: null == conversationID
          ? _value.conversationID
          : conversationID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserConversationImpl implements _UserConversation {
  const _$UserConversationImpl(
      {required this.id, required this.conversationID, required this.userID});

  factory _$UserConversationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserConversationImplFromJson(json);

  @override
  final String id;
  @override
  final String conversationID;
  @override
  final String userID;

  @override
  String toString() {
    return 'UserConversation(id: $id, conversationID: $conversationID, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conversationID, conversationID) ||
                other.conversationID == conversationID) &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, conversationID, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserConversationImplCopyWith<_$UserConversationImpl> get copyWith =>
      __$$UserConversationImplCopyWithImpl<_$UserConversationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserConversationImplToJson(
      this,
    );
  }
}

abstract class _UserConversation implements UserConversation {
  const factory _UserConversation(
      {required final String id,
      required final String conversationID,
      required final String userID}) = _$UserConversationImpl;

  factory _UserConversation.fromJson(Map<String, dynamic> json) =
      _$UserConversationImpl.fromJson;

  @override
  String get id;
  @override
  String get conversationID;
  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$UserConversationImplCopyWith<_$UserConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
