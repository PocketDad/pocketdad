// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itemUser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemUser _$ItemUserFromJson(Map<String, dynamic> json) {
  return _ItemUser.fromJson(json);
}

/// @nodoc
mixin _$ItemUser {
  String get id => throw _privateConstructorUsedError;
  String get itemID => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemUserCopyWith<ItemUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemUserCopyWith<$Res> {
  factory $ItemUserCopyWith(ItemUser value, $Res Function(ItemUser) then) =
      _$ItemUserCopyWithImpl<$Res, ItemUser>;
  @useResult
  $Res call({String id, String itemID, String userID});
}

/// @nodoc
class _$ItemUserCopyWithImpl<$Res, $Val extends ItemUser>
    implements $ItemUserCopyWith<$Res> {
  _$ItemUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemID = null,
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemUserImplCopyWith<$Res>
    implements $ItemUserCopyWith<$Res> {
  factory _$$ItemUserImplCopyWith(
          _$ItemUserImpl value, $Res Function(_$ItemUserImpl) then) =
      __$$ItemUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String itemID, String userID});
}

/// @nodoc
class __$$ItemUserImplCopyWithImpl<$Res>
    extends _$ItemUserCopyWithImpl<$Res, _$ItemUserImpl>
    implements _$$ItemUserImplCopyWith<$Res> {
  __$$ItemUserImplCopyWithImpl(
      _$ItemUserImpl _value, $Res Function(_$ItemUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemID = null,
    Object? userID = null,
  }) {
    return _then(_$ItemUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
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
class _$ItemUserImpl implements _ItemUser {
  const _$ItemUserImpl(
      {required this.id, required this.itemID, required this.userID});

  factory _$ItemUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemUserImplFromJson(json);

  @override
  final String id;
  @override
  final String itemID;
  @override
  final String userID;

  @override
  String toString() {
    return 'ItemUser(id: $id, itemID: $itemID, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemID, itemID) || other.itemID == itemID) &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemID, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemUserImplCopyWith<_$ItemUserImpl> get copyWith =>
      __$$ItemUserImplCopyWithImpl<_$ItemUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemUserImplToJson(
      this,
    );
  }
}

abstract class _ItemUser implements ItemUser {
  const factory _ItemUser(
      {required final String id,
      required final String itemID,
      required final String userID}) = _$ItemUserImpl;

  factory _ItemUser.fromJson(Map<String, dynamic> json) =
      _$ItemUserImpl.fromJson;

  @override
  String get id;
  @override
  String get itemID;
  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$ItemUserImplCopyWith<_$ItemUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
