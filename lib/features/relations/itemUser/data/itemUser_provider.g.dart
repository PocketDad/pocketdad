// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemUser_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemUserDatabaseHash() => r'07bd95facfe6b55ae1ca268c69ae39419e5c8cba';

/// See also [itemUserDatabase].
@ProviderFor(itemUserDatabase)
final itemUserDatabaseProvider = AutoDisposeProvider<ItemUserDatabase>.internal(
  itemUserDatabase,
  name: r'itemUserDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemUserDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemUserDatabaseRef = AutoDisposeProviderRef<ItemUserDatabase>;
String _$itemUsersHash() => r'1db7f103c963e90c38697710eaaaa5ab02f27598';

/// See also [itemUsers].
@ProviderFor(itemUsers)
final itemUsersProvider = AutoDisposeStreamProvider<List<ItemUser>>.internal(
  itemUsers,
  name: r'itemUsersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemUsersRef = AutoDisposeStreamProviderRef<List<ItemUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
