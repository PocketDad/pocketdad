// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemDatabaseHash() => r'e2fea9735926cf7e988b5b87d7ea2f79e12cff1a';

/// See also [itemDatabase].
@ProviderFor(itemDatabase)
final itemDatabaseProvider = AutoDisposeProvider<ItemDatabase>.internal(
  itemDatabase,
  name: r'itemDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemDatabaseRef = AutoDisposeProviderRef<ItemDatabase>;
String _$itemsHash() => r'506cfb0a5cbf043332e009a51779b975648918e1';

/// See also [items].
@ProviderFor(items)
final itemsProvider = AutoDisposeStreamProvider<List<Item>>.internal(
  items,
  name: r'itemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemsRef = AutoDisposeStreamProviderRef<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
