// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskUser_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskUserDatabaseHash() => r'bacd176f71e3f599bbbf35ce315a4a658aa02828';

/// See also [taskUserDatabase].
@ProviderFor(taskUserDatabase)
final taskUserDatabaseProvider = AutoDisposeProvider<TaskUserDatabase>.internal(
  taskUserDatabase,
  name: r'taskUserDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskUserDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskUserDatabaseRef = AutoDisposeProviderRef<TaskUserDatabase>;
String _$taskUsersHash() => r'7b9ce96f06056d190016c3e0e8188a500ea09948';

/// See also [taskUsers].
@ProviderFor(taskUsers)
final taskUsersProvider = AutoDisposeStreamProvider<List<TaskUser>>.internal(
  taskUsers,
  name: r'taskUsersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskUsersRef = AutoDisposeStreamProviderRef<List<TaskUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
