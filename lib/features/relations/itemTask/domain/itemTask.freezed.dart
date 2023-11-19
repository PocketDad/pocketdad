// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itemTask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemTask _$ItemTaskFromJson(Map<String, dynamic> json) {
  return _ItemTask.fromJson(json);
}

/// @nodoc
mixin _$ItemTask {
  String get id => throw _privateConstructorUsedError;
  String get itemID => throw _privateConstructorUsedError;
  String get taskID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemTaskCopyWith<ItemTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemTaskCopyWith<$Res> {
  factory $ItemTaskCopyWith(ItemTask value, $Res Function(ItemTask) then) =
      _$ItemTaskCopyWithImpl<$Res, ItemTask>;
  @useResult
  $Res call({String id, String itemID, String taskID});
}

/// @nodoc
class _$ItemTaskCopyWithImpl<$Res, $Val extends ItemTask>
    implements $ItemTaskCopyWith<$Res> {
  _$ItemTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemID = null,
    Object? taskID = null,
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
      taskID: null == taskID
          ? _value.taskID
          : taskID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemTaskImplCopyWith<$Res>
    implements $ItemTaskCopyWith<$Res> {
  factory _$$ItemTaskImplCopyWith(
          _$ItemTaskImpl value, $Res Function(_$ItemTaskImpl) then) =
      __$$ItemTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String itemID, String taskID});
}

/// @nodoc
class __$$ItemTaskImplCopyWithImpl<$Res>
    extends _$ItemTaskCopyWithImpl<$Res, _$ItemTaskImpl>
    implements _$$ItemTaskImplCopyWith<$Res> {
  __$$ItemTaskImplCopyWithImpl(
      _$ItemTaskImpl _value, $Res Function(_$ItemTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemID = null,
    Object? taskID = null,
  }) {
    return _then(_$ItemTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as String,
      taskID: null == taskID
          ? _value.taskID
          : taskID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemTaskImpl implements _ItemTask {
  const _$ItemTaskImpl(
      {required this.id, required this.itemID, required this.taskID});

  factory _$ItemTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String itemID;
  @override
  final String taskID;

  @override
  String toString() {
    return 'ItemTask(id: $id, itemID: $itemID, taskID: $taskID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemID, itemID) || other.itemID == itemID) &&
            (identical(other.taskID, taskID) || other.taskID == taskID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemID, taskID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemTaskImplCopyWith<_$ItemTaskImpl> get copyWith =>
      __$$ItemTaskImplCopyWithImpl<_$ItemTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemTaskImplToJson(
      this,
    );
  }
}

abstract class _ItemTask implements ItemTask {
  const factory _ItemTask(
      {required final String id,
      required final String itemID,
      required final String taskID}) = _$ItemTaskImpl;

  factory _ItemTask.fromJson(Map<String, dynamic> json) =
      _$ItemTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get itemID;
  @override
  String get taskID;
  @override
  @JsonKey(ignore: true)
  _$$ItemTaskImplCopyWith<_$ItemTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
