// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskDatabaseHash() => r'97393db88d51dde2a9c3e16d59eb883f27fcf528';

/// See also [taskDatabase].
@ProviderFor(taskDatabase)
final taskDatabaseProvider = AutoDisposeProvider<TaskDatabase>.internal(
  taskDatabase,
  name: r'taskDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskDatabaseRef = AutoDisposeProviderRef<TaskDatabase>;
String _$tasksHash() => r'0df015b08d9555aa4e9be5c9bbeb56d35be4fb14';

/// See also [tasks].
@ProviderFor(tasks)
final tasksProvider = AutoDisposeStreamProvider<List<Task>>.internal(
  tasks,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TasksRef = AutoDisposeStreamProviderRef<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
