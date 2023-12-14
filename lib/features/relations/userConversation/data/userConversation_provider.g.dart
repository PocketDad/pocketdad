// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userConversation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userConversationDatabaseHash() =>
    r'68741a108475789808365b18c5d866a0070b678c';

/// See also [userConversationDatabase].
@ProviderFor(userConversationDatabase)
final userConversationDatabaseProvider =
    AutoDisposeProvider<UserConversationDatabase>.internal(
  userConversationDatabase,
  name: r'userConversationDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userConversationDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserConversationDatabaseRef
    = AutoDisposeProviderRef<UserConversationDatabase>;
String _$userConversationsHash() => r'dfa43df68a5c56182da3d05091c9302122a868b7';

/// See also [userConversations].
@ProviderFor(userConversations)
final userConversationsProvider =
    AutoDisposeStreamProvider<List<UserConversation>>.internal(
  userConversations,
  name: r'userConversationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userConversationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserConversationsRef
    = AutoDisposeStreamProviderRef<List<UserConversation>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
