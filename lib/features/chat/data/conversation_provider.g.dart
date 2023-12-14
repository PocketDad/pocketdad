// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$conversationDatabaseHash() =>
    r'593165226bdb99bc148ae0289a3692c8a2efcdde';

/// See also [conversationDatabase].
@ProviderFor(conversationDatabase)
final conversationDatabaseProvider =
    AutoDisposeProvider<ConversationDatabase>.internal(
  conversationDatabase,
  name: r'conversationDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conversationDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConversationDatabaseRef = AutoDisposeProviderRef<ConversationDatabase>;
String _$conversationsHash() => r'6d073015ae879f3901b46804b98d0a388eae5144';

/// See also [conversations].
@ProviderFor(conversations)
final conversationsProvider =
    AutoDisposeStreamProvider<List<Conversation>>.internal(
  conversations,
  name: r'conversationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conversationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConversationsRef = AutoDisposeStreamProviderRef<List<Conversation>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
