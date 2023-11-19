// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemTask_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemTaskDatabaseHash() => r'b45e348e4d7f4f4e0c5fd45cc916e2c9490379fd';

/// See also [itemTaskDatabase].
@ProviderFor(itemTaskDatabase)
final itemTaskDatabaseProvider = AutoDisposeProvider<ItemTaskDatabase>.internal(
  itemTaskDatabase,
  name: r'itemTaskDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemTaskDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemTaskDatabaseRef = AutoDisposeProviderRef<ItemTaskDatabase>;
String _$itemTasksHash() => r'caf5824e44ede2ca2450073b97491d8f309a43cc';

/// See also [itemTasks].
@ProviderFor(itemTasks)
final itemTasksProvider = AutoDisposeStreamProvider<List<ItemTask>>.internal(
  itemTasks,
  name: r'itemTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemTasksRef = AutoDisposeStreamProviderRef<List<ItemTask>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
